import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/model/style/TextStyle.dart';

import '../Homenavigation_par.dart';
class resturant {
  late final int id;
  late final String title,price,image;

  resturant({required this.id, required this.price, required this.title,required this.image, });
}
List<resturant> MyData = [
  resturant(
    id: 1,
    title: "big mac",


    price: "160",
    image: "assets/images/big.jpg",

  ),
  resturant(
    id: 2,
    title: "big mac ",

    price: " 160",
    image: "assets/images/big.jpg",

  ),
  resturant(
    id: 3,
    title: "big mac ",


    price: " 160",
    image: "assets/images/big.jpg",

  ),  resturant(
    id: 4,
    title: "big mac ",


    price: "60",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),  resturant(
    id: 5,
    title: "big mac ",

    price: " 160",
    image: "assets/images/big.jpg",

  ),
];
class favourite extends StatefulWidget {
  const favourite({Key? key}) : super(key: key);
  @override
  _favouriteState createState() => _favouriteState();
}
class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
           // Navigator.pop(context, MaterialPageRoute(
             // builder: (context) => navigationbar(),));
          },),
        backgroundColor: Color(-1088543194), toolbarHeight: 100,
        title: Text("Favourites"),

      ),
      body: Container(
          width: 400,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: 270,
                width: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 400,
                        height: 200,
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/Cairo-McDonalds.jpg",
                            fit: BoxFit.fill,),),),),
                    SizedBox(width: 13.0,),
                    Container(
                      width: 350,
                      height: 30,
                      child: Text('macDonalds', style: s2,),),
                  ],),),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: MyData.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 150,
                      width: 200,
                      child: Card(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 110,
                                  height: 130,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.asset(MyData[index].image,
                                      height: 150.0,
                                      width: 100.0,
                                      fit: BoxFit.fitHeight,),),
                                ),
                                SizedBox(width: 20,),
                                Row(
                                  children: [
                                    Container(
                                      height: 130,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                                MyData[index].title,
                                                style: TextStyle(
                                                  fontSize: 13.0,)),
                                            SizedBox(height: 10,),
                                            RatingBar.builder(
                                              initialRating: 5,
                                              itemSize: 15,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              itemBuilder: (context, _) =>
                                                  Icon(Icons.star,
                                                    color: Colors.amber,),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },),
                                          ]),),
                                    SizedBox(width: 80,),

                                    Container(
                                      height: 100,
                                      child: Text(MyData[index].price,
                                          style: TextStyle(fontSize: 15.0,)),),
                                  ],),
                              ]
                          )

                      ),

                    );
                  }
              ),
            ],
          )
      ),
    );
  }
}