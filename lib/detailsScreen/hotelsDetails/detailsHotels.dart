import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/model/style/TextStyle.dart';
class hotel {
  late final int id;
  late final String text,price,image,num1,num2;

  hotel({required this.id, required this.price, required this.text,required this.image,required this.num1,required this.num2 });
}
List<hotel> MyData = [
  hotel(
    id: 1,
    text: "Jw Marriott Cannes Online Reservations. Book Jw Marriott Cannes at the best available rates. 24/7 Support. Fast & Simple. Reviews, Photos, Location, Compare Deals."

    "Chic, Trendy Hotels · Fast and Simple · Online Reservations"
"Amenities: WiFi, Pool, Parking, Spa, 24 Hour Reception, Restaurant",


    price: "160.00\$",
    image: "assets/images/big.jpg",
    num1: "4.1",
    num2: "1.144",

  ),
];
class DetaisHotels extends StatefulWidget {
  const DetaisHotels(int index, {Key? key}) : super(key: key);
  @override
  _DetaisHotelsState createState() => _DetaisHotelsState();
}
class _DetaisHotelsState extends State<DetaisHotels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context,);
            },),
        backgroundColor: Color(-1088543194), toolbarHeight: 100,
        title: Text("Details"),
      ),
      body: Container(
          width: 400,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: 320,
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
                            "assets/images/1-a.jpg",
                            fit: BoxFit.fill,),),),),
                    SizedBox(width: 13.0,),
                    Container(
                      width: 350,
                      height: 30,
                      child: Text('JwMariot', style: s2,),),

                  ],),),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: MyData.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 400,
                      width: 400,
                      child: Column(
                          children:[
                            Container(
                              height: 40,
                              width: 320,
                              child: Text('Details', style: s1,),),
                               Container(
                                  width: 320,
                                  height: 130,
                                  child: Text(MyData[index].text,),
                                ),
                                SizedBox(height: 60,),
                            Container(

                              child: Row(
                                children: [
                                Container(
                                    width: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text("Price",style: s1,),
                                    )),
                                  Container(
                                      width:160,
                                      child: Text("Review",style: s1,)),
                              ],),
                            ),
                            Row(
                              children: [
                                Container(
                                    width: 180,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(MyData[index].price,),
                                    )
                                ),
                               Row(children: [
                                 Container(
                                     width: 30,
                                     child: Text(MyData[index].num1,)
                                 ),
                                 Container(
                                     width: 80,
                                     child: RatingBar.builder(
                                       initialRating: 6,
                                       itemSize: 15,
                                       minRating: 1,
                                       direction: Axis.horizontal,
                                       allowHalfRating: true,
                                       itemCount: 4,
                                       itemPadding: EdgeInsets.symmetric(
                                           horizontal: 1.0),
                                       itemBuilder: (context, _) =>
                                           Icon(Icons.star,
                                             color: Colors.amber,),
                                       onRatingUpdate: (rating) {
                                         print(rating);
                                       },),
                                 ),
                                 Container(
                                     width: 55,

                                     child: Text(MyData[index].num2,)
                                 ),

                               ],)

                              ],),
                            SizedBox(height: 20,),
                            Container(
                              height: 50,
                              alignment: AlignmentDirectional.bottomEnd,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                elevation: 5.0,
                                child: Text("Book now ",style: TextStyle(color: Colors.white,fontSize: 15),),
                                color: Color(-1088543194),
                                onPressed: () {

                                },
                              ),
                            )

                              ]

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