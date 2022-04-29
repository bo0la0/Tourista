import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/modules/home/screen/Widgets/homeNav.dart';
import 'package:tourista/modules/splash/login/login_screen.dart';
import 'package:tourista/modules/splash/signup/background.dart';
import 'package:tourista/modules/splash/signup/cubit/cubit.dart';
import 'package:tourista/modules/splash/signup/cubit/state.dart';
import 'package:tourista/modules/splash/signup/or_divider.dart';
import 'package:tourista/modules/splash/signup/social_icon.dart';
import 'package:tourista/modules/splash/signup/verfiying.dart';
import 'package:tourista/shared/components/already_have_an_account_acheck.dart';
import 'package:tourista/shared/components/rounded_button.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';
import 'package:tourista/shared/components/rounded_password_field.dart';


class Body extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller1 = TextEditingController();
  var passwordcontroller2 = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccess){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const homeNav()),
            );
          }
        },
        builder: (context,state){
          return Background(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "signup",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40 ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/signup.svg",
                      height: size.height * 0.25,
                    ),
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (value) {},
                      controller: emailcontroller,
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                      controller: passwordcontroller1,
                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                      hintText: 'retype password',
                      controller: passwordcontroller2,
                    ),
                    RoundedButton(
                      text: "SIGNUP",
                      press: () {

                        if(formKey.currentState!.validate() && passwordcontroller2.text == passwordcontroller1.text){
                          RegisterCubit.get(context).userRegister(email: emailcontroller.text, password: passwordcontroller1.text);
                        }else{
                          print('not match');
                          return 'not match';}
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return verfey();
                        //     },
                        //   ),
                        // );
                      },
                    ),//signup button
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    OrDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocalIcon(
                          iconSrc: "assets/icons/facebook.svg",
                          press: () {},
                        ),
                        SocalIcon(
                          iconSrc: "assets/icons/twitter.svg",
                          press: () {},
                        ),
                        SocalIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                          press: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
