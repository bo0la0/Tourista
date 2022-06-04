import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourista/model/ProductsModel.dart';
import 'package:tourista/model/ServiceProvidrModel.dart';
import 'package:tourista/model/TouristTripModel.dart';
import 'package:tourista/model/TransactionModel.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/model/registerModel.dart';
import 'package:tourista/modules/home/screen/homePagesNav/TabBarhome.dart';
import 'package:tourista/modules/home/screen/homePagesNav/camera.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/profile_screen.dart';
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
        print(error.toString());
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
      print('seconed errror :${error.toString()}');
      emit(ImageUpdateErrorState());
    });
  }

  void addBalance({required int amount}) {
    updateUser(balance: model!.balance + amount);
    // model?.balance = '$x';
    // emit(AddBalanceState());
  }

  List<ServiceProviderModel> bazar = [];
  List<ServiceProviderModel> nightservices = [];
  List<ServiceProviderModel> dailyservices = [];
  List<ServiceProviderModel> resturantservices = [];
  void getData(){
    getDatatoList(category: 'Bazaar',List: bazar);
    getDatatoList(category: 'NightService',List: nightservices);
    getDatatoList(category: 'Restaurant',List: resturantservices);
    getDatatoList(category: 'DailyService',List: dailyservices);

  }
  void getDatatoList({required String category,required List<ServiceProviderModel> List}) {
    emit(AppGetdataLoadingState());
    FirebaseFirestore.instance.collection('ServiceProviders').where("category",isEqualTo: "$category")
        .get().then((value) {
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
    FirebaseFirestore.instance.collection('Products').get().then((value) {
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
    FirebaseFirestore.instance.collection('Trips')
        .snapshots()
        .listen((event)
    {
      trips=[];
      event.docs.forEach((element)
    {
      trips.add(Trips.fromJson(element.data()));
    });
    });
      emit(AppGetTripsSuccessState());
  }

  void bookTrip(
      {required int price,
        required int balance,
        required String details,
        required DateTime time,
        String? tripId,
        String? Address,
        int seats = 1,
      }) {
    final TripRef = FirebaseFirestore.instance.collection("Trips").doc(tripId);
    final UserRef = FirebaseFirestore.instance.collection("accounts").doc(uId);
    TransactionModel TransModel = TransactionModel(
      transactionId: '',
      TouristUid: uId,
      Time: time,
      details: details,
      balance: balance,
      price: price,
    );
    var availbaleSeats;
    contain = TouristsList.any((element) => element.touristuId == "$uId");
print(contain.toString());
    emit(BookingTripLoadingState());
    if (balance >= price*seats) {
      if(contain == false) {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        final snapshot = await transaction.get(TripRef);
         availbaleSeats = snapshot.get("availableSeats");
        if(availbaleSeats >= seats){
            balance -= (price * seats);
            transaction.update(TripRef, {"availableSeats": (availbaleSeats - seats)});
            transaction.update(UserRef, {"balance": balance});
        }
      }).then((value) {
        if(availbaleSeats >= seats){
          getUserData();
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
            price: price * seats,
            trip: tripId,
          );
          FirebaseFirestore.instance
              .collection('transactions')
              .doc(value.id)
              .set(TransModel.toMap())
              .then((value) {
            ShowToast(text: 'Book Success ** to cancel go to my activity');
            addTouristToTrip(tripId: tripId, Address: Address,seats: seats);
            getActivity();
            emit(BookingTripSuccessState());
          }).catchError((e){print(e.toString());});
            });

        } else{emit(BookingTripErrorState());
          ShowToast(text: 'sorry trip is completed');}
      }).catchError((e){
        emit(BookingTripErrorState());
        print('transcations error is ${e.toString()}');
      });

      }else{emit(BookingTripErrorState());
        ShowToast(text: 'you already booked this trip');}
    } else {emit(BookingTripErrorState());
      ShowToast(text: 'please recharge your balance');
    }
  }

  void addTouristToTrip({
    String? tripId,
    String? Address,
    required int seats,
  }){
    TouristTripModel tourist = TouristTripModel(
      touristuId: uId,
      location: Address,
      tripId: tripId,
      seats: seats,
      name: model?.name,
      phone: model?.phone,
      attend: false,
      image: model?.image,
    );
    FirebaseFirestore.instance
        .collection('Trips').doc('$tripId').collection('Tourists')
        .add(tourist.toMap())
        .then((value){
      FirebaseFirestore.instance
          .collection('Trips').doc('$tripId').collection('Tourists')
          .doc('${value.id}').update({'docId':value.id});
    })
        .catchError((e){
          print(e.toString());

    });

  }
bool contain = false;
  void updateSeats({ String? id,int seats = 1}){
    FirebaseFirestore.instance.collection('Trips').doc(id).update({
      "availableSeats": FieldValue.increment(seats),
    });

  }
  List<Trips> bookedTrips = [];
  List<TouristTripModel> listofbookedtripsId = [];
  void getActivity(){
    bookedTrips = [];
    listofbookedtripsId = [];
    final TripRef = FirebaseFirestore.instance.collection('Trips');

    TripRef.get().then((value) {value.docs.forEach((element) {
      element.reference.collection('Tourists')
          .where('touristuId',isEqualTo:'$uId' )
          .get().then((value)
      { value.docs.forEach((element)
      { listofbookedtripsId.add(TouristTripModel.fromJson(element.data()));
        listofbookedtripsId.forEach((element) { TripRef.doc('${element.tripId}').get().then((value) {
          bookedTrips.add(Trips.fromJson(value.data()!));
        }); });
      });
      }
      );
    });
      }).catchError((e){
        print(e.toString());
    });
    // FirebaseFirestore.instance.collection('TouristsBookTrips').where('touristuId',isEqualTo:'$uId' )
    //     .get().then((value) {
    //   value.docs.forEach((element) {
    //     listofbookedtripsId.add(TouristTripModel.fromJson(element.data()));});
    //       listofbookedtripsId.forEach((element) {
    //         FirebaseFirestore.instance.collection('Trips').where('id',isEqualTo:'${element.tripId}')
    //             .get().then((value){
    //           value.docs.forEach((element) {
    //             bookedTrips.add(Trips.fromJson(element.data()));
    //           }
    //           );
    //           //emit(updatebookedlistscusses());
    //         });
    //       });
    //     });
    // print('test11111111111111');
    emit(updatebookedlist());
  }

  List<TouristTripModel> TouristsList = [];

  void getTouristinTrips({required String tripId}) {

    FirebaseFirestore.instance.collection('Trips').doc('$tripId')
        .get().then((value) {
          value.reference.collection('Tourists').get().then((value)
          {
            TouristsList = [];
            value.docs.forEach((element) {
             TouristsList.add(TouristTripModel.fromJson(element.data()));
            // if( TouristsList.any((element) => element.docId == id)){
            //   }else{}
          });
          });
    }).catchError((e){print(e.toString());});
  }

void cancelTrip({String? TripId, int? price, int seats =1}){
    emit(cancelTripLoadingState());
    final TripRef = FirebaseFirestore.instance.collection('Trips').doc('$TripId').collection('Tourists');
    TripRef.where('touristuId',isEqualTo: '$uId')
        .get().then((value)
    {
       TripRef.doc(value.docs.single.id).delete();

    }).then((value) {
      getActivity();
      updateSeats(id: TripId,seats: seats);
      updateUser(balance: model!.balance + (price! * seats));
      ShowToast(text: 'cancel Success');
      emit(cancelTripSuccessState());
    }).catchError((e){
      print(e.toString());
      emit(cancelTripErrorState());

    });

}

  void cancelSeat({String? TripId, int? price, required int cancelseats ,required int seats}){
    emit(cancelTripLoadingState());
    final TripRef = FirebaseFirestore.instance.collection('Trips').doc('$TripId').collection('Tourists');

    TripRef.where('touristuId', isEqualTo: '$uId')
        .get().then((value) {

      TripRef.doc(value.docs.single.id)
          .update({'seats': seats - cancelseats});

    }).then((value) {
      updateSeats(id: TripId,seats: cancelseats);
      updateUser(balance: model!.balance + (price! * cancelseats));
      ShowToast(text: 'cancel Success');
      getActivity();
      emit(cancelTripSeatSuccessState());
    });

  }
  int? total ;
  late int seats ;
  void TotalPrice ({required int price,required int seats}){
    total = price * seats;
    emit(updateSeatState());
  }

  String? Address;
  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
  // Future<void> GetAddressFromLatLong(Position position)async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark place = placemarks[1];
  //   Address = '${place.street}, ${place.name} , ${place.postalCode}';
  //
  // }
// void learn (){
//   final sfDocRef = FirebaseFirestore.instance.collection("cities").doc("SF");
//   FirebaseFirestore.instance.runTransaction((transaction) async {
//   final snapshot = await transaction.get(sfDocRef);
//   // Note: this could be done without a transaction
//   //       by updating the population using FieldValue.increment()
//   final newPopulation = snapshot.get("population") + 1;
//   transaction.update(sfDocRef, {"population": newPopulation});
// }).then(
// (value) => print("DocumentSnapshot successfully updated!"),
// onError: (e) => print("Error updating document $e"),
// );}
  }

