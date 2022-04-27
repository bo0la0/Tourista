import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tourista/shared/BlocObserver.dart';
import 'modules/splash/login/login_screen.dart';
import 'shared/components/constants.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  blocObserver: MyBlocObserver();
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

    home: LoginScreen(),

    );
// hello
  }
}

