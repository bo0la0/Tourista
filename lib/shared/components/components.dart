  import 'package:flutter/material.dart';

import 'constants.dart';

Widget defaultButton({
    double width =  double.infinity,
    Color background = Colors.grey,
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
  TextInputType type = TextInputType.text,
  VoidCallback? onSubmit,
  VoidCallback? onChanged,
  Function? validate,
  required String label,
  required IconData prefix,
  })=> TextFormField(
  controller: controller,
  keyboardType: type ,
  // onFieldSubmitted: onSubmit,
  // onChanged: onChanged,
   validator: (v){
    validate!(v);
   },
  decoration: InputDecoration(
  labelText : label,
  prefixIcon : Icon (
    prefix,
  ),
  border: OutlineInputBorder()
),

);


