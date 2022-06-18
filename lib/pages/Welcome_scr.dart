import 'package:flutter/material.dart';
import 'package:tourista/widgests/app_large_text.dart';
import 'package:tourista/widgests/app_text.dart';

import '../modules/splash/signup/SignUp.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List images = [
    "images.png",
    "book.jpg",
    "imm.png",
    "kk.jpg",
  ];
  List inttext= [
    "E Shoping",
    "Booking hotels",
    "E-Wallet",
    "Booking trips",
  ];
  List midtexe = [
    "Explore thaousands of items & grape them ( No more fraud )",
    "Get best hotels deals",
    "Depositing money "
        "buying items through E-Transation",
    "Get best deals,"
        " knowing other tourists "
        " Different languages don`t matter auto-translation is here",
  ];
  List text =[
     "Skip",
    "Skip",
    "Skip",
    "SignUp",
  ];
  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              margin: const EdgeInsets.only(top:150) ,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/"+images[index]
                      ),

                  )
              ),

              child: Container(
                margin: const EdgeInsets.only(left: 20,right:20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: inttext[index]),

                        Container(
                          margin: const EdgeInsets.only(top:20) ,
                          width: 250,
                          child: AppText(text: midtexe [index] ),
                        ),
                       // SizedBox(height: 40,),
                        /*ResponsiveButton(width:120, text:"skip",
                          onPressed: () {
                        Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context) => LoginScreen(),),
                           );
                          },
                        ),*/
                        Container(
                          height:60,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                         // margin: const EdgeInsets.only(top:5, right: 150) ,
                          child: Align(

                            alignment: Alignment.bottomLeft,
                            child: MaterialButton(

                              //padding: EdgeInsets.fromLTRB(45,2,45,2),
                              child: Text( text[index]),

                              color: Colors.grey,
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(
                                    builder:(context) => SignUpScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),


                       ],
                    ),
                    //zedBox(width:5),
                    Column (

                      //margin: const EdgeInsets.only(right: 2)
                      children: List.generate(4, (indexDots) {
                        //overflow: TextOverflow.ellipsis;
                        return Container(
                          margin: const EdgeInsets.only(left: 62, bottom: 3),
                          width: 8,
                          height: index==indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexDots?Colors.black38:Colors.black38.withOpacity(0.2)
                          ),
                        );
                    },
                    )

                    )
                  ],
                ),
              ),
            );

          }),
    );
  }
}