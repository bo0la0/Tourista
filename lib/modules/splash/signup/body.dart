import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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
import 'package:tourista/shared/components/already_have_an_account_acheck.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/rounded_button.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';
import 'package:tourista/shared/components/rounded_password_field.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';




class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var emailcontroller = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordcontroller1 = TextEditingController();

  var passwordcontroller2 = TextEditingController();

  var dropvalue= 'English';

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is CreateUserSuccess){
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value){
              uId = state.uId;
              AppCubit.get(context).getUserData();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => homeNav()),
                    (Route<dynamic> route) => false,
              );
            });
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
                      controller: emailcontroller,
                      icon: Icons.email,
                    ),
                    RoundedInputField(
                      hintText: "Full name",
                      controller: nameController,
                      text: 'name must not be empty',
                    ),
                    RoundedInputField(
                      hintText: "phone",
                      controller: phoneController,
                      icon: Icons.phone,
                      text: 'phone must not be empty',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Language : '),
                        SizedBox(width: 10,),
                        DropDownButton(selectedValue: dropvalue, items: ['English','española','italiana','française','deutsch','русский'],onChanged: (value){
                        setState(() {
                          dropvalue = value!;
                           });}),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ConditionalBuilder(
                      condition: state is! UserRegisterLoading,
                      builder: (context)=> RoundedButton(
                        text: "SIGNUP",
                        press: () {
                          if(formKey.currentState!.validate()){
                            if (passwordcontroller2.text != passwordcontroller1.text){
                              Alert(context: context, title: "passwords dosen't match", desc: "please check your password").show();
                            }else{
                              RegisterCubit.get(context).userRegister(
                                email: emailcontroller.text,
                                password: passwordcontroller1.text,
                                name: nameController.text,
                                phone: phoneController.text,
                                dropvalue: dropvalue,
                              );}
                          }

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return verfey();
                          //     },.
                          //   ),
                          // );
                        },
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
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
                        // SocalIcon(
                        //   iconSrc: "assets/icons/facebook.svg",
                        //   press: () {},
                        // ),
                        // SocalIcon(
                        //   iconSrc: "assets/icons/twitter.svg",
                        //   press: () {},
                        // ),
                        SocalIcon(
                          iconSrc: "assets/icons/google-plus.svg",
                          press: () {
                            RegisterCubit.get(context).signInwithGoogle();
                          },
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

