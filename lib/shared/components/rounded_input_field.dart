import 'package:flutter/material.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/text_field_container.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextInputType type;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  Function? validate;
   RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.type = TextInputType.emailAddress,
    required this.controller,
     this.validate,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: type,
        onFieldSubmitted : onChanged,
        cursorColor: kPrimaryColor,
        controller: controller,
        validator: (String? s){
        if (s!.isEmpty){
          return 'email must not be empty' ;
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
