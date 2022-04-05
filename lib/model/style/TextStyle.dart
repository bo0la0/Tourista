
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
TextStyle s1 =
 TextStyle(
    fontSize: 15,
   fontWeight: FontWeight.normal,

   color: Colors.black87,
  fontFamily: 'Cairo',

);
TextStyle s2 =TextStyle(

  fontSize: 20,
  color: Colors.black87,
  fontWeight: FontWeight.bold,
  fontFamily: 'Cairo',

);
TextStyle s3 =TextStyle(

  fontSize: 15,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Cairo',

);TextStyle s4 =TextStyle(

  fontSize: 13,
  color: Colors.white,
  fontWeight: FontWeight.normal,
  fontFamily: 'Cairo',

);TextStyle s5 =TextStyle(

  fontSize: 15,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontFamily: 'Cairo',

);
class Mystyle extends StatefulWidget{
  String _text;
  TextStyle _textStyle;

  Mystyle(this._text,this._textStyle);

  @override
  _MystyleState createState() => _MystyleState();
}

class _MystyleState extends State<Mystyle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget._text,style:widget._textStyle,);
  }
}
