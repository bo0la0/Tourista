import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourista/model/ProductsModel.dart';
import 'package:tourista/model/ServiceProvidrModel.dart';
import 'package:tourista/model/TransactionModel.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/model/registerModel.dart';
import 'package:tourista/modules/home/screen/homePagesNav/TabBarhome.dart';
import 'package:tourista/modules/home/screen/homePagesNav/camera.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/profile_screen.dart';
import 'package:tourista/modules/hotelsDetails/productModel.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/states.dart';

import '../../modules/home/screen/homePagesNav/scan_qr.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;

  void getUserData() {
    emit(AppGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('accounts')
        .doc(uId)
        .get()
        .then((value) {
      //print(value.data());
      model = UserModel.fromJson(value.data()!);
      emit(AppGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    home(),
    camera(),
    Scan_qr(),
    // CategoriesScreen(),
    ProfileScreen(),
  ];

  List<String> titles = [
    'Home',
    'camera',
    'scan_qr',
    // 'CategoriesScreen',
    'Settings',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }

  File? profilePic;
  var picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePic = File(pickedFile.path);
      uploadProfilPic();
      emit(AppImagePickedSuccessState());
    } else {
      print('no picked image');
      emit(AppImagePickedErorrState());
    }
  }

  String? ProfileUrl = null;

  void uploadProfilPic() {
    FirebaseStorage.instance
        .ref()
        .child(
            'users/profilePic/${Uri.file(profilePic!.path).pathSegments.last}')
        .putFile(profilePic!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        ProfileUrl = value;
        emit(ImageUploadSuccessState());
      }).catchError((error) {
        emit(ImageUploadErrorState());
      });
    }).catchError((error) {
      emit(ImageUploadErrorState());
    });
  }

  void updateUser({
    String? name,
    String? email,
    String? phone,
    String? image,
    int? balance,
    String? language,
  }) {
    emit(ImageUpdateLoadingState());

    UserModel modelUpdate = UserModel(
      name: name ?? model?.name,
      email: email ?? model?.email,
      phone: phone ?? model?.phone,
      image: image ?? model?.image,
      balance: balance ?? model!.balance,
      uId: model?.uId,
      language: language ?? model?.language,
    );
    FirebaseFirestore.instance
        .collection('accounts')
        .doc(model?.uId)
        .update(modelUpdate.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(ImageUpdateErrorState());
    });
  }

  void addBalance() {
    updateUser(balance: model!.balance + 1000);
    // model?.balance = '$x';
    // emit(AddBalanceState());
  }

  List<ServiceProviderModel> bazar = [];
  List<ServiceProviderModel> nightservices = [];
  List<ServiceProviderModel> dailyservices = [];
  List<ServiceProviderModel> resturantservices = [];
  void getData(){
    getDatatoList(collectionName: 'Bazzars',List: bazar);
    getDatatoList(collectionName: 'NightServices',List: nightservices);
    getDatatoList(collectionName: 'restaurants',List: resturantservices);
    getDatatoList(collectionName: 'DailyServices',List: dailyservices);

  }
  void getDatatoList({required String collectionName,required List<ServiceProviderModel> List}) {
    emit(AppGetdataLoadingState());
    FirebaseFirestore.instance.collection(collectionName).get().then((value) {
      value.docs.forEach((element) {
        List.add(ServiceProviderModel.fromJson(element.data()));
      });
      emit(AppGetdataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetdataErrorState(error.toString()));
    });
  }


  void changeIcon({required int index,required List<IconData>faouriteIcons,required List<bool> isPressed}) {
    isPressed[index] = !isPressed[index];
    faouriteIcons[index] =
        isPressed[index] ? Icons.favorite : Icons.favorite_outline;
    emit(ChangeIconState());
  }

  List<ProductsModel> productModel = [];

  void getProducts(){
    emit(AppGetdataLoadingState());
    FirebaseFirestore.instance.collection('products').get().then((value) {
      value.docs.forEach((element) {
        productModel.add(ProductsModel.fromJson(element.data()));
      });
      emit(AppGetdataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetdataErrorState(error.toString()));
    });
  }
  List<Trips> trips=[];
  void getTrips() {
    emit(AppGetTripsLoadingState());
    FirebaseFirestore.instance.collection('Trips').get().then((value) {
      value.docs.forEach((element) {
        trips.add(Trips.fromJson(element.data()));
      });
      emit(AppGetTripsSuccessState());
    }).catchError((error) {
      //print(error.toString());
      emit(AppGetTripsErrorState(error.toString()));
    });
  }

  void bookTrip(
      {required int price,
        required int balance,
        required String details,
        required DateTime time,
        String? tripId,}) {
    emit(BookingTripLoadingState());

    TransactionModel TransModel = TransactionModel(
      transactionId: '',
      TouristUid: uId,
      Time: time,
      details: details,
      balance: balance,
      price: price,
    );
    if (balance >= price) {
      balance -= price;
      FirebaseFirestore.instance
          .collection('transactions')
          .add(TransModel.toMap())
          .then((value) {
        TransModel = TransactionModel(
          transactionId: value.id,
          TouristUid: uId,
          Time: time,
          details: details,
          balance: balance,
          price: price,
          trip: tripId ?? 'done',

        );
        FirebaseFirestore.instance
            .collection('transactions')
            .doc(value.id)
            .set(TransModel.toMap())
            .then((value) {
          updateUser(balance: balance);
          emit(BookingTripSuccessState());
        });
      }).catchError((error) {
        emit(BookingTripErrorState());
      });
    } else {
      ShowToast(text: 'please recharge your balance');
    }
  }

  }

