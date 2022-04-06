
import 'package:flutter/material.dart';
import 'package:tourista/screen/homePagesNav/Homenavigation_par.dart';
import 'package:tourista/screen/homePagesNav/favouritScreen/favourite.dart';
import 'package:tourista/splash/Screen_one.dart';


import 'detailsScreen/hotelsDetails/detailsHotels.dart';
import 'splash/LOGIN.dart';
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
          backgroundColor: Colors.white
      ),
    home: Screen_one (),

    );
// hello
  }
}

