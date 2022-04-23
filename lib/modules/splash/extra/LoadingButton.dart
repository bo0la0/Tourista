import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../Screen_one.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  @override
 /** void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Screen_one()));
    });
  }**/

  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: 600,
        width: 400,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
                Container(
                  height: 60,
                  width: 100,
                  child: Container(

                    child: IconButton(onPressed: () {},

                        icon: Icon(

                          Icons.check_circle_outlined, color: Colors.grey, size: 100.0,)),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(70.0),
                child: Text("Verification Code Send on "
                      "your Regeistered Mobile Number"),
              ),

        ]),
      )


    );
  }
}
