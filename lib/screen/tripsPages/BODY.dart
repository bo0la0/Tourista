import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:tourista/screen/tripsPages/PlacesGiza.dart';
import 'package:tourista/screen/tripsPages/row.dart';

import 'AswanPlaces.dart';
import 'ROW4.dart';
import 'Row2.dart';
import 'Row3.dart';
import 'SiniaPlaces.dart';
import 'TripsNear.dart';
class BODY extends StatelessWidget {
  const BODY({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              SizedBox(height: 10,),
              row(),
              GizaPlace(),
              SizedBox(height: 10,),

              row2(),
              nearPlace(),
              SizedBox(height: 10,),

              row3(),
              AswanPlace(),
              ROW4(),
              SiniaTrips(),


            ]
        )

    );

  }

}