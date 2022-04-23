import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/modules/home/screen/homePagesNav/Homenavigation_par.dart';
import 'package:tourista/modules/splash/LOGIN.dart';
import 'package:tourista/modules/splash/signup/background.dart';
import 'package:tourista/modules/splash/signup/or_divider.dart';
import 'package:tourista/modules/splash/signup/social_icon.dart';
import 'package:tourista/shared/components/already_have_an_account_acheck.dart';
import 'package:tourista/shared/components/rounded_button.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';
import 'package:tourista/shared/components/rounded_password_field.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Tourista",
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
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
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
    );
  }
}
