import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/model/style/TextStyle.dart';
class Bazzars {
  late final int id;
  late final String title,image;

  Bazzars({required this.id,  required this.title,required this.image,});
}
List<Bazzars> myDummy = [
  Bazzars(
    id: 1,
    title: "Khan Elkhalili",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),
  Bazzars(
    id: 2,
    title: " Aswan Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

  ),
  Bazzars(
    id: 3,
    title: "sharm Elshaikh",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

  ),
  Bazzars(
    id: 4,
    title: "Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

  ),
  Bazzars(
    id: 5,
    title: "Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",

  ),Bazzars(
    id: 6,
    title: "Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
  ),



];
class BazzarServices extends StatefulWidget {
  const BazzarServices({Key? key}) : super(key: key);

  @override
  _BazzarServicesState createState() => _BazzarServicesState();
}

class _BazzarServicesState extends State<BazzarServices> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          height: 210,
          width: 250,
          child:  ListView(
            scrollDirection: Axis.horizontal,

            children: [

              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myDummy.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
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
                                              child: Image.asset(myDummy[index].image,
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
                                Text(myDummy[index].title,
                                    style: TextStyle(fontSize: 13.0,)),
                                SizedBox(height: 10,),
                                /**Container(
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
                                    )**/
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

