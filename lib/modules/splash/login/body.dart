import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/modules/home/screen/Widgets/homeNav.dart';
import 'package:tourista/modules/splash/login/cubit/cubit.dart';
import 'package:tourista/modules/splash/login/cubit/state.dart';
import 'package:tourista/modules/splash/signup/SignUp.dart';
import 'package:tourista/modules/splash/signup/or_divider.dart';
import 'package:tourista/modules/splash/signup/social_icon.dart';
import 'package:tourista/shared/components/already_have_an_account_acheck.dart';
import 'package:tourista/shared/components/rounded_button.dart';
import 'package:tourista/shared/components/rounded_password_field.dart';
import 'package:tourista/modules/splash/login/background.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';

class Body extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is UserLoginSuccess){
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
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.25,
                    ),
                    SizedBox(height: size.height * 0.03),
                    RoundedInputField(
                      hintText: "Your Email",
                      onChanged: (value) {},
                      controller: emailcontroller,
                    //   validate: (String value){
                    //     if (value.isEmpty){
                    //       return 'email must not be empty';
                    //     }
                    //     return null;
                    // },

                    ),
                    RoundedPasswordField(
                      onChanged: (value) {},
                      controller: passwordcontroller,
                      // validate: (String value){
                      //   if (value.isEmpty){
                      //     return 'password must not be empty';
                      //   }
                      //   return null;
                      // },
                    ),
                    ConditionalBuilder(
                      condition: state is! UserLoginLoading,
                      builder: (context)=> RoundedButton(
                        text: "LOGIN",
                        press: () {
                          if (formKey.currentState!.validate()){
                            LoginCubit.get(context).userLogin(email: emailcontroller.text, password: passwordcontroller.text);
                          }
                        },
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
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
