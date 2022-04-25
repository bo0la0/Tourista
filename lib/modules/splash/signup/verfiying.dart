import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/modules/home/screen/homePagesNav/Homenavigation_par.dart';
import 'package:tourista/modules/splash/signup/or_divider.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/components/rounded_button.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';

class verfey extends StatelessWidget {
  const verfey({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "verification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40 ),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                RoundedInputField(
                  hintText: "verification code",
                  onChanged: (value) {},
                  icon: Icons.alarm_rounded ,
                ),
                RoundedButton(
                  text: "submit",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return navigationbar();
                        },
                      ),
                    );
                  },
                ),//signup button
                SizedBox(height: size.height * 0.03),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      " ReSend Code ",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "click here",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
