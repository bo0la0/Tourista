import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'package:tourista/modules/userVerify/continuPhone.dart';

class signin extends StatelessWidget {
  var nameController =TextEditingController();
  var emailController =TextEditingController();
  var passWordController =TextEditingController();
  var ageController =TextEditingController();
  var countryController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
                reverse: false,



                children: [
                  SafeArea(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'TOURISTA',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Text(
                    'Enter Your Name',
                      style: s1
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                      ),

                      controller: nameController,
                      keyboardType:TextInputType.text ,
                      onFieldSubmitted: (value){print (value);},
                      onChanged: (value){print(value);},
                    ),
                  ),

                  SizedBox(height: 20.0,),
                  Text(
                    'Enter Your Email',
                      style: s1
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(


                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,

                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),

                      ),

                      controller: emailController,
                      keyboardType:TextInputType.emailAddress ,
                      onFieldSubmitted: (value){print (value);},
                      onChanged: (value){print(value);},
                    ),
                  ),
                  SizedBox(height: 20.0,),

                  Text(
                    'Enter Password',
                      style: s1
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color:Colors.white,
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock,),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                      controller: passWordController,
                      keyboardType:TextInputType.visiblePassword ,
                      onFieldSubmitted: (value){print (value);},
                      onChanged: (value){print(value);},
                      obscureText:true ,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Phone Number',
                      style: s1
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color:Colors.white,
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock,),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                      controller: passWordController,
                      keyboardType:TextInputType.visiblePassword ,
                      onFieldSubmitted: (value){print (value);},
                      onChanged: (value){print(value);},
                      obscureText:true ,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                      'Enter Your Age',
                      style: s1
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                      ),

                      controller: ageController,
                      keyboardType:TextInputType.number ,
                      onFieldSubmitted: (value){print (value);},
                      onChanged: (value){print(value);},
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    'Enter Your Country',
                    style: s1
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        border:OutlineInputBorder(),
                      ),

                      controller: countryController,
                      keyboardType:TextInputType.text ,
                      onFieldSubmitted: (value){print (value);},
                      onChanged: (value){print(value);},
                    ),
                  ),
                  SizedBox(height: 40.0,),

                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color:Colors.grey,



                    ),

                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder:(context) => ContinueWithPhone(),
                            ),
                          );
                        },

                          child: Center(
                            child: Text(
                              'VERIFY',
                              style:TextStyle(color: Colors.white,fontSize: 20)
                            ),
                          ),
                        ),
                      ),

                  SizedBox(height: 20.0,),

                ]

            ),
          ),
        ),


    );
  }
}