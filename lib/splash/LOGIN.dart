import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'package:tourista/splash/signIn.dart';
import 'package:tourista/splash/verifyingsplashload.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(

                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'TOURISTA',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),

                    child: TextField(
                      onTap: (){
                       Navigator.push(context,
                          MaterialPageRoute(
                            builder:(context) => verifying(),
                          ),
                        );


                      },

                      decoration: InputDecoration(
                        labelText: "Enter your phone",

                        border:OutlineInputBorder(),
                      ),

                    keyboardType:TextInputType.phone ,


                    ),
                  ),
                  Container(
                    height: 40.0,width: 300.0,
                    child:  Row(

                      children: const[
                        Expanded(
                          child:Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 2,
                            indent: 10,
                            endIndent: 10,
                          ),),


                        Text("OR",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,

                          ),),
                        Expanded(
                          child:Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 2,
                            indent: 10,
                            endIndent: 10,
                          ),),
                      ],),


                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          IconButton(onPressed: (){}, icon: Icon(Icons.facebook,  color: Colors.blue,size:30.0,)),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                      "log in with facebook",
                                      style:s1
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      width: double.infinity,
                      child: Row(
                        children: <Widget>[
                          IconButton(onPressed: (){}, icon: Icon(Icons.add,  color: Colors.blue,size:30.0,)),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(
                                    builder:(context) => signin(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                      "Verify and Create Account",
                                      style:s1
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),


                ],
    ),


    )))

    );
  }
}
