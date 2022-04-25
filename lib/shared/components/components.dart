  import 'package:flutter/material.dart';

Widget defaultButton({
    double width =  double.infinity,
    Color background = Colors.blue,
    required VoidCallback function,
    required String text,
  }) => Container(
  width: width,
  color: background,
  child:  MaterialButton(

    onPressed: function,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);