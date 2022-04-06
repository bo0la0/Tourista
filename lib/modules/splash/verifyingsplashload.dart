import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'dart:async';
import 'LoadingButton.dart';
class verifying extends StatefulWidget {
  @override
  _verifyingState createState() => _verifyingState();
}
class _verifyingState extends State<verifying>{
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          height: 500,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),strokeWidth: 5.0,),
              SizedBox(height: 50,),
              Text("Verifing your mobile number",style: s1,),
            ],
          ),
        )


    );
  }
}