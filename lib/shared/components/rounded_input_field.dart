import 'package:flutter/material.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/text_field_container.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  String text ;
  Function? validate;
   RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.type = TextInputType.emailAddress,
    required this.controller,
     this.validate,
     this.text = 'email must not be empty',

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: type,
        cursorColor: kPrimaryColor,
        controller: controller,
        validator: (String? s){
        if (s!.isEmpty){
          return  text;
        }
        return null;
        },
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
