import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
class homevisit extends StatefulWidget {
  const homevisit({Key? key}) : super(key: key);

  @override
  _homevisitState createState() => _homevisitState();
}

class _homevisitState extends State<homevisit> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        child:  ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Top Destenation",style: s2,),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: MyData.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(


                    child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(children: [

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
                                Container(
                                  height: 20,
                                  width: 50,
                                  child: IconButton(onPressed: (){}, icon:Icon(Icons.add_location,size: 30,color: Colors.grey,),
                                  ),
                                ),
                              ]
                                ,),
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

                                    SizedBox(width: 60,height: 60,),

                                    Container(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      height: 60,
                                      width: 120,

                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                        elevation: 5.0,
                                        child: Text("Book ",style: TextStyle(color: Colors.white,fontSize: 10),),
                                        color: Color(-1088543194),
                                        onPressed: () {

                                        },
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

