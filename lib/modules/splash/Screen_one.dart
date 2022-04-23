import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:tourista/model/style/TextStyle.dart';

import 'login/login_screen.dart';

class Data {

   final String  title;
   final String  imageUrl;
   final String description;

  Data({
    required this.title,
    required this.description,
    required this.imageUrl,

  });
}
class Screen_one extends StatefulWidget {
  @override
  _Screen_oneState createState() => _Screen_oneState();
}
class _Screen_oneState  extends State<Screen_one>{
final List<Data> myData=[
  Data(
    title: "E Shoping",
    description: "ExPLORE top souvenirs && grap them",
    imageUrl: "assets/images/images.png",

  ),
  Data(
    title: "Booking hotels",
    description: "helo and welcome",
    imageUrl: "assets/images/book.jpg",

  ),
  Data(
    title: "E-Wallet",
    description: "S-Depositing money &buying items"
        "through E-Transation",
    imageUrl: "assets/images/imm.png",
  ),
  Data(
    title: "Booking trips",
    description:  "Get best deals and knowing new tourists andandand"
                     "Different languages doesn`t matter"
                         "auto-translation is here"
    ,
    imageUrl: "assets/images/kk.jpg",
  ),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageIndicatorContainer(


      child:PageView(
            children: myData.map((item) =>
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(height: 130, child: Image.asset(item.imageUrl),),
                  Text(item.title,style: s1),
                  Padding(padding: EdgeInsets.symmetric(vertical: 14, horizontal: 64), child: Text(item.description,style: s5),),
                ],),),
        ).toList(),
        ),
            length: myData.length,
            align: IndicatorAlign.bottom,
            indicatorSpace: 5.0,
            padding: const EdgeInsets.all(100),
            indicatorColor: Colors.black12,
            indicatorSelectorColor: Colors.orange,
            shape: IndicatorShape.roundRectangleShape()),
          Container(
            height:650,
            width: 600,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(45,2,45,2),
                child: Text("Next",style:s3),
                color: Color(-1088543194),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ),
          ),

    ],
      ),
    );

  }
}




