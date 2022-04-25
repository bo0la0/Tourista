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

Widget dfaultTexField({
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback? onSubmit,
  VoidCallback? onChanged,
  required VoidCallback validate,
  required String label,
  required IconData prefix,
  })=> TextFormField(
  controller: controller,
  keyboardType: type ,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: validate,
  decoration: InputDecoration(
  labelText : label,
  prefixIcon : Icon (
    prefix,
  ),
  border: OutlineInputBorder()
),

);