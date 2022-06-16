import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/rounded_button.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class FeedBack extends StatelessWidget {
  var FeedBackController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: Text('Tourista'),
              backgroundColor: kPrimaryColor,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35,top: 8,right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "FeedBack",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SvgPicture.asset(
                        "assets/icons/login.svg",
                        height: size.height * 0.25,
                      ),
                      SizedBox(height: size.height * 0.03),
                      TextFormField(
                       controller: FeedBackController,
                       textAlign: TextAlign.center,
                        validator: (s){
                         if (s!.isEmpty){
                           return 'please enter FeedBack';
                         }

                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter FeedBack',

                        ),
                        maxLines: 5,
                        minLines: 1,

                      ),
                      ConditionalBuilder(
                        condition: state is! getFeedBackLoadingstate,
                        builder: (context)=> RoundedButton(
                          text: "Submit",
                          press: () {
                            if (formKey.currentState!.validate()){
                             AppCubit.get(context).getFeedBack(FeedBack: FeedBackController.text);
                            }
                            Navigator.pop(context);
                          },
                        ),
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

        },

      );

  }
}