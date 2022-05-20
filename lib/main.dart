import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/home/screen/Widgets/homeNav.dart';
import 'package:bloc/bloc.dart';
import 'package:tourista/modules/splash/login/cubit/cubit.dart';
import 'package:tourista/modules/splash/signup/cubit/cubit.dart';

import 'package:tourista/pages/Welcome_scr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourista/shared/BlocObserver.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';
import 'package:tourista/shared/network/remote/dio_helper.dart';
import 'modules/splash/Screen_one.dart';
import 'modules/splash/Splash_Screen.dart';
import 'modules/splash/login/cubit/state.dart';
import 'modules/splash/login/login_screen.dart';
import 'modules/splash/signup/SignUp.dart';
import 'shared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  blocObserver: MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  uId = CacheHelper.getData(key: 'uId');


  if(uId != null)
  {
    widget = homeNav();
  }else
  {
    widget = Splash_Screen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));

// user login in state
  //
  // if (uId != null){
  //   widget = homeNav();
  //
  // }else {
  //   widget = LoginScreen();
  // }
}
class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({
    required this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData()..getData()..getProducts(collectionName: 'BazaarProducts'),
        ),


      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                          backgroundColor: Colors.white,
                          primaryColor: kPrimaryColor,
                          scaffoldBackgroundColor: Colors.white,
                            ),
            home: startWidget,
          );
        },
      ),
    );

  }
}

