import 'package:flutter/material.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;
  bool isPass;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.hintText='password',
    required this.controller ,
    this.isPass = true,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: widget.isPass,
        onChanged: widget.onChanged,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                widget.isPass = !widget.isPass;
              });
            },
            icon: Icon(
              widget.isPass ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
