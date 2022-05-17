import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourista/model/registerModel.dart';
import 'package:tourista/modules/home/screen/homePagesNav/TabBarhome.dart';
import 'package:tourista/modules/home/screen/homePagesNav/camera.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/profile_screen.dart';
import 'package:tourista/modules/home/screen/homePagesNav/favouritScreen/favourite.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/states.dart';

import '../../modules/home/screen/homePagesNav/scan_qr.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;


  void getUserData()
  {
    emit(AppGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('accounts')
        .doc(uId)
        .get()
        .then((value)
    {
          //print(value.data());
         model = UserModel.fromJson(value.data()!);
          emit(AppGetUserSuccessState());
    })
        .catchError((error) {
          print(error.toString());
      emit(AppGetUserErrorState(error.toString()));

    });
  }

  int currentIndex = 0;

  List<Widget> screens =
  [
    home(),
    camera(),
    Scan_qr(),
    favourite(),
    ProfileScreen(),
  ];

  List<String> titles =
  [
    'Home',
    'camera',
    'scan_qr',
    'favourite',
    'Settings',
  ];

  void changeBottomNav(int index)
  {
      currentIndex = index;
      emit(AppChangeBottomNavState());

  }

  File? profilePic;
  var picker = ImagePicker();

  Future<void> getImage() async
  {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery
    );
    if (pickedFile != null){
      profilePic = File(pickedFile.path);
      uploadProfilPic();
      emit(AppImagePickedSuccessState());
    }else
      {
        print('no picked image');
        emit(AppImagePickedErorrState());
      }

  }

  String? ProfileUrl = null;
  void uploadProfilPic(){
    FirebaseStorage.instance
        .ref()
        .child('users/profilePic/${Uri.file(profilePic!.path).pathSegments.last}')
        .putFile(profilePic!)
        .then((value){
          value.ref.getDownloadURL()
              .then((value){
                ProfileUrl = value;
                emit(ImageUploadSuccessState());
          }).catchError((error){
            emit(ImageUploadErrorState());
          });
    })
        .catchError((error){
      emit(ImageUploadErrorState());

    });
  }

  void updateUser({
  String? name,
  String? email,
  String? phone,
  String? image,
  String? balance,
  String? language,
})
  {
    emit(ImageUpdateLoadingState());

      UserModel modelUpdate = UserModel(
        name: name??model?.name,
        email: email??model?.email,
        phone: phone??model?.phone,
        image: image??model?.image,
        balance: balance??model?.balance,
        uId: model?.uId,
        language: language??model?.language,
      );
      FirebaseFirestore.instance
          .collection('accounts')
          .doc(model?.uId)
          .update(modelUpdate.toMap())
          .then((value) {
        getUserData();
      })
          .catchError((error) {
        emit(ImageUpdateErrorState());
      });

  }

  //for balance
  int? x = 0 ;

  void addBalance()
{
x = (x! + 1000) ;
updateUser(balance: '$x');
    // model?.balance = '$x';
    // emit(AddBalanceState());

}

 }