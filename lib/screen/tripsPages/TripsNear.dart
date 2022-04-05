
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class TripsNear {
  late final int id;
  late final String title,  price,image;

  TripsNear({required this.id, required this.price, required this.title,required this.image,});
}
class nearPlace extends StatefulWidget {
  const nearPlace({Key? key}) : super(key: key);

  @override
  _nearPlaceState createState() => _nearPlaceState();
}

class _nearPlaceState extends State<nearPlace> {
  List<TripsNear> MyData = [
    TripsNear(
      id: 1,
      price: '500',
      title: "TripsNear",
      image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

    ),
    TripsNear(
      id: 2,
      price: '500',
      title: "TripsNear",
      image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

    ),
    TripsNear(
      id: 3,
      price: '\$500',
      title: "TripsNear",
      image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

    ),
    TripsNear(
      id: 4,
      price: '\$500',
      title: "TripsNear",
      image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

    ),
    TripsNear(
      id: 5,
      price: '\$500',
      title: "TripsNear",
      image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

    ),TripsNear(
      id: 6,
      price: '\$500',
      title: "TripsNear",
      image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

    ),TripsNear(
      id:7,
      price: '\$500',
      title: "TripsNear",
      image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

    ),



  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: 280,
          width: 250,
          child:  ListView(
            scrollDirection: Axis.horizontal,

            children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MyData.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 240,
                      width: 150,
                      child: Container(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 150,
                                      height: 140,
                                      child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              child: Image.asset(MyData[index].image,
                                                height: 140.0,
                                                width: 120.0,
                                                fit: BoxFit.fitHeight,),),
                                            Container(
                                              height: 25,
                                              width: 120,
                                              alignment: AlignmentDirectional.topEnd,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,

                                                child: Icon(Icons.favorite_outline, color: Colors.red,
                                                  size: 20,),
                                              ),

                                            ),])
                                  ),
                                ),
                                RatingBar.builder(
                                  initialRating: 5,
                                  itemSize: 15,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },),
                                Text(MyData[index].title,
                                    style: TextStyle(fontSize: 13.0,)),
                                SizedBox(height: 10,),

                                Text(
                                    MyData[index].price, style: TextStyle(fontSize: 15.0,)),
                                Container(
                                  height: 30,
                                  width: 130,
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                    elevation: 5.0,
                                    child: Text("more details",style: TextStyle(color: Colors.white,fontSize: 10),),
                                    color: Color(-1088543194),
                                    onPressed: () {

                                    },
                                  ),
                                )
                              ]

                          )),
                    );
                  }
              ),],
          )

      ),
    );
  }
}

