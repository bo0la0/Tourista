import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/model/bannerModel.dart';
import 'package:tourista/model/style/TextStyle.dart';
class visitplaces {
  late final int id;
  late final String title,image,address;

  visitplaces({required this.id,  required this.title,required this.image, required  this.address});
}
List<visitplaces> MyData = [
  visitplaces(
    id: 1,
    title: "Jw mariott",
    address: 'cairo.Egypt',
    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),
  visitplaces(
    id: 2,
    title: "heleton ",
    address: 'cairo.Egypt',


    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),
  visitplaces(
    id: 3,
    title: "pyramids",
    address: 'cairo.Egypt',

    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),  visitplaces(
    id: 4,
    title: "khan khalil" ,
    address: 'cairo.Egypt',

    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),  visitplaces(
    id: 5,
    title: "le passge ",
    address: 'cairo.Egypt',

    image: "assets/images/Khan-El-Khalili-Bazaar-trip2egypt-8.jpg",

  ),

];
List<String> banner = [
  'https://m.fourseasons.com/alt/img-opt/~70..0,0000-700,0000-3000,0000-2250,0000/publish/content/dam/fourseasons/images/web/JTT/JTT_269_original.jpg',
  'https://www.etbtoursegypt.com/storage/117/fortress-qaitbay-alexandria-day-tour-cairo-trip-alexandria-excursion-day-tours-egypt-excursions.jpg',
  'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/activity_headers/301664/600x400-1-50-a9c042365c79321b30915cc19be2578e.jpg',
  'https://www.mediastorehouse.com/p/629/colossi-memnon-11996690.jpg.webp',
  'https://firebasestorage.googleapis.com/v0/b/tourism-45327.appspot.com/o/placestovisit%2Fluxor-egypt-january-mortuary-temple-hatshepsut-also-known-as-djeser-djeseru-mortuary-temple-ancient-luxor-egypt-173573225.jpg?alt=media&token=56d8fc26-234c-4ec6-aff4-49b970a20670',
  'https://firebasestorage.googleapis.com/v0/b/tourism-45327.appspot.com/o/placestovisit%2F8d.jpg?alt=media&token=40eafc16-acb0-4bd3-96f0-a0fc984bcdcf',
  'https://firebasestorage.googleapis.com/v0/b/tourism-45327.appspot.com/o/placestovisit%2F3.jpg?alt=media&token=41ca9722-fc4d-4fcf-ab2f-2b6b59d43e3a',
  'https://firebasestorage.googleapis.com/v0/b/tourism-45327.appspot.com/o/placestovisit%2F2.jpg?alt=media&token=5b6f8c39-727c-4a7f-9872-deae09bea634',

];
class homevisit extends StatefulWidget {
  const homevisit({Key? key}) : super(key: key);

  @override
  _homevisitState createState() => _homevisitState();
}

class _homevisitState extends State<homevisit> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        child:  ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.center,
                  child: Text("Top Destenation",style: s2,)),
            ),
            CarouselSlider(
              items: banner
                  .map((e) =>
                    Image(
                      image: NetworkImage(e),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),).toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: MyData.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(children: [
                                Container(
                                  width: 150,
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.asset(MyData[index].image,
                                      fit: BoxFit.fitHeight,),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:0,right: 50),
                                  child: IconButton(onPressed: (){}, icon:Icon(Icons.add_location,size: 30,color: Colors.grey,),
                                  ),
                                ),
                              ]
                                ,),
                              Padding(
                                padding: const EdgeInsets.only(top:20,left: 40),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children:[
                                      Text(MyData[index].title,
                                          style: TextStyle(fontSize: 20.0,
                                          fontWeight: FontWeight.w500,)),
                                      SizedBox(height: 10,),
                                      Text(
                                          MyData[index].address, style: TextStyle(fontSize: 17.0,)),
                                      SizedBox(height: 20,),
                                      RatingBar.builder(
                                        initialRating: 5,
                                        itemSize: 20,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                        itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                            '516 Reviews', style: TextStyle(fontSize: 16.0,)),
                                      ),
                                    ]),
                              ),





                            ]

                        ),
                      )

                  );
                }
            ),
          ],
        )
    );
  }
}

