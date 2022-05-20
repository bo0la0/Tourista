import 'package:flutter/material.dart';
import 'package:tourista/modules/home/screen/services/row1.dart';
import 'BazzarsServices.dart';
import 'DailyServices.dart';
import 'NightLife.dart';
import 'Row2.dart';
import 'Row3.dart';
import 'RestuServices.dart';
import 'Row4.dart';
class BodyServices extends StatelessWidget {
  const BodyServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
              children: <Widget>[
                SizedBox(height: 10,),
                ROW1(),
                RestuServices(),
                SizedBox(height: 10,),
                ROW2(),
                BazzarServices(),
                SizedBox(height: 10,),
                ROW3(),
                NightLifeServices(),
                SizedBox(height: 10,),
                ROW4(),
                DailyServices(),

              ]
          ),


      ),

    );
  }
}
