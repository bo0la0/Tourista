import 'package:flutter/material.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'package:tourista/userVerify/verti.dart';

import 'NumericPad.dart';
class ContinueWithPhone extends StatefulWidget {
  @override
  _ContinueWithPhoneState createState() => _ContinueWithPhoneState();
}
class _ContinueWithPhoneState extends State<ContinueWithPhone> {

  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.close, size: 30, color: Colors.black,),
          title: Text("Continue with phone", style: s2,
          ),
          backgroundColor: Colors.white, elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,),
        body: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.white,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          child: Image.asset('assets/images/verti.jpg',),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 64), child: Text("You'll receive a 4 digit code to verify next.",
                          style: s1),),],),),),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25),),),
                  child: Padding(
                    padding: EdgeInsets.all(22),
                    child: Row(
                      children: <Widget>[
                        Container(width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Enter your phone",
                                style: s1

                            ),

                            SizedBox(
                              height: 8,
                            ),

                            Text(
                              phoneNumber,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ],
                        ),
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => VerifyPhone(phoneNumber: phoneNumber)),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "verify",
                                style:s2
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              NumericPad(
                onNumberSelected: (value) {
                  setState(() {
                    if(value != -1){
                      phoneNumber = phoneNumber + value.toString();
                    }
                    else{
                      phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
                    }
                  });
                },
              ),

            ],
          )));

  }
}