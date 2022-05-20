import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = kPrimaryColor,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
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
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      // onFieldSubmitted: onSubmit,
      // onChanged: onChanged,
      validator: (v) {
        validate!(v);
      },
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          ),
          border: OutlineInputBorder()),
    );

void ShowToast({
  required String text,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: kPrimaryColor,
      textColor: kPrimaryLightColor,
      fontSize: 16.0,
    );

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );
