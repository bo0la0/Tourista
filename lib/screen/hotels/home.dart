import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../hotelsDetails/detailsHotels.dart';
import '../../hotelsDetails/productModel.dart';

class Hotel {
  late final int id;
  late final String title,price,image,address;

  Hotel({required this.id, required this.price, required this.title,required this.image, required  this.address});
}
List<Hotel> MyData = [
  Hotel(
    id: 1,
    title: "Jw mariott",
    address: 'cairo.Egypt',
    price: " Avr 160 Per/night",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",
  ),
  Hotel(
    id: 2,
    title: "heleton ",
    address: 'cairo.Egypt',
    price: " Avr 160Per night",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",
  ),
  Hotel(
    id: 3,
    title: "le passge ",
    address: 'cairo.Egypt',
    price: " Avr 160 Per/night",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",
  ),
];
List<details> MyData2 = [
  details(
    id: 1,
    title: "Jw mariott",
    text: "Jw Marriott Cannes Online Reservations. Book Jw Marriott Cannes at the best available rates. 24/7 Support. Fast & Simple. Reviews, Photos, Location, Compare Deals."
        "Chic, Trendy Hotels · Fast and Simple · Online Reservations"
        "Amenities: WiFi, Pool, Parking, Spa, 24 Hour Reception, Restaurant",
    price: "160.00\$",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",
    num1: "4.1",
    num2: "1.144",

  ),
  details(
    id: 2,
    title: "heleton ",
    text: "lepaisssssss  Cannes Online Reservations. Book Jw Marriott Cannes at the best available rates. 24/7 Support. Fast & Simple. Reviews, Photos, Location, Compare Deals."
        "Chic, Trendy Hotels · Fast and Simple · Online Reservations"
        "Amenities: WiFi, Pool, Parking, Spa, 24 Hour Reception, Restaurant",
    price: "160.00\$",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",
    num1: "4.1",
    num2: "1.144",

  ), details(
    id: 2,
    title: "le passge ",
    text: "lepaisssssss  Cannes Online Reservations. Book Jw Marriott Cannes at the best available rates. 24/7 Support. Fast & Simple. Reviews, Photos, Location, Compare Deals."
        "Chic, Trendy Hotels · Fast and Simple · Online Reservations"
        "Amenities: WiFi, Pool, Parking, Spa, 24 Hour Reception, Restaurant",
    price: "160.00\$",
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",
    num1: "4.1",
    num2: "1.144",

  ),
];
class Home_Hotel extends StatefulWidget {
  const Home_Hotel({Key? key}) : super(key: key);
  @override
  _Home_HotelState createState() => _Home_HotelState();
}
class _Home_HotelState extends State<Home_Hotel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        child:  ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 50,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Location'),
                    SizedBox(width: 13.0,),
                    Container(
                      width: 120,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: Text('All'
                        ),
                  ),),],),
              ),),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: MyData.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                    height: 200,
                    width: 600,
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
                               Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children:[
                               Text(MyData[index].title,
                                   style: TextStyle(fontSize: 15.0,)),
                                     SizedBox(height: 10,),

                                     Text(
                                     MyData[index].address, style: TextStyle(fontSize: 13.0,)),
                                 SizedBox(height: 10,),
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


                              ]),

                               Container(
                                 height: 200,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 20,height: 10,),

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 100,
                                          width: 120,
                                          child: Center(

                                            child: Text(MyData[index].price,
                                                style: TextStyle(fontSize: 12.0,)),
                                          ),
                                        ),
                                      ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Container(
                                           alignment: AlignmentDirectional.bottomEnd,
                                           height: 50,
                                           width: 120,

                                           child: MaterialButton(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                            elevation: 5.0,
                                            child: Text("Book ",style: TextStyle(color: Colors.white,fontSize: 10),),
                                            color: Color(-1088543194),
                                             onPressed: () {
                                               Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaisHotels(
                                                 text: MyData2[index].text,
                                                 image: MyData2[index].image,
                                                 id: MyData2[index].id,
                                                 title: MyData2[index].title,
                                                 price: MyData2[index].price,
                                                 num1: MyData2[index].num1,
                                                 num2: MyData2[index].num2,



                                               )),);

                                             },
                                      ),
                                         ),
                                       ),




                                  ],),
                               ),





                            ]

                        )

                    ),

                  );
                  }
                  ),
          ],
        )
    );
  }
}

