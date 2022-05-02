import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/splash/signup/cubit/cubit.dart';
import 'package:tourista/modules/splash/signup/cubit/state.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController controller;

  Function? validate;
  String text;

  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.hintText='password',
    required this.controller ,
    this.validate,
    this.text = 'password must not be empty',

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context,state){
          return TextFieldContainer(
            child: TextFormField(
              obscureText: RegisterCubit.get(context).isPass,
              onChanged: onChanged,
              controller: controller,
              cursorColor: kPrimaryColor,
              validator: (String? s){
                if (s!.isEmpty){
                  return text;
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: hintText,
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: (){
                    RegisterCubit.get(context).passwordVisibility();
                  },
                  icon: Icon(
                    RegisterCubit.get(context).suffix,
                    color: kPrimaryColor,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          );
        },
      ),
    );
    // TODO: implement build

  }

}


