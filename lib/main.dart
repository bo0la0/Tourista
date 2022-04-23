
import 'package:flutter/material.dart';
import 'package:tourista/modules/home/screen/homePagesNav/Homenavigation_par.dart';
import 'package:tourista/modules/home/screen/homePagesNav/favouritScreen/favourite.dart';
import 'package:tourista/modules/splash/Screen_one.dart';
import 'package:tourista/modules/splash/Splash_Screen.dart';


import 'modules/detailsScreen/hotelsDetails/detailsHotels.dart';
import 'modules/splash/extra/LOGIN.dart';
import 'modules/splash/signup/SignUp.dart';
import 'modules/splash/signup/body.dart';
import 'shared/components/constants.dart';
void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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

    home: Splash_Screen(),

    );
// hello
  }
}

