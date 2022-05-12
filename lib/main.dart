import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tourista/modules/home/screen/Widgets/homeNav.dart';
import 'package:tourista/pages/Welcome_scr.dart';

import 'package:tourista/shared/BlocObserver.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';
import 'modules/splash/Screen_one.dart';
import 'modules/splash/Splash_Screen.dart';
import 'modules/splash/login/login_screen.dart';
import 'modules/splash/signup/SignUp.dart';
import 'shared/components/constants.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  blocObserver: MyBlocObserver();
  await CacheHelper.init();
  runApp(MyApp());

// user login in state
  // var uId = CacheHelper.getData(key: 'uId');
  //
  // if (uId != null){
  //   widget = homeNav();
  //
  // }else {
  //   widget = LoginScreen();
  // }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
      ),

    home: Splash_Screen()

    );
// hello
  }
}

