import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/registerModel.dart';
import 'package:tourista/modules/home/screen/homePagesNav/TabBarhome.dart';
import 'package:tourista/modules/home/screen/homePagesNav/camera.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/profile_screen.dart';
import 'package:tourista/modules/home/screen/homePagesNav/favouritScreen/favourite.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/states.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';

import '../../modules/home/screen/homePagesNav/scan_qr.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;


  void getUserData()
  {
    emit(AppGetUserLoadingState());
print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
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


 }