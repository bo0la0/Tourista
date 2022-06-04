import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
class visitplaces {

  late final String title,image,desc,location;

  visitplaces({  required this.title,required this.image, required  this.desc,required this.location});
}
List<visitplaces> MyData = [
  visitplaces(
    title: "Giza Pyramids",
    desc: 'Explore the Giza Pyramids, Sphinx, and the Egyptian Museum, then visit Tahrir Square and Khan Khalili Bazaar on a full-day tour',
    image: "assets/images/visitplaces/2.jpg",
    location : 'https://goo.gl/maps/1v11W4JyRKUbib8BA',
  ),
  visitplaces(
    title: "Luxor & Abu Simbel",
    desc: 'explore the most sumptuous landmarks in three of the most majestic tourist cities all over Egypt',
    image: "assets/images/visitplaces/luxor.jpg",
    location : 'https://goo.gl/maps/Bt2SnWsDQxgT8Xwr8',
  ),
  visitplaces(
    title: "Alexandria",
    desc: 'feel its majestic life force and uncover the glorious history Alexandria',
    image: "assets/images/visitplaces/alex.jpg",
    location : 'https://goo.gl/maps/poCyFnpg8bd2nU1A8',
  ),

];
List<String> banner = [
  'assets/images/visitplaces/2.jpg',
  'assets/images/visitplaces/3.jpg',
  'assets/images/visitplaces/4.jpg',
  'assets/images/visitplaces/5.webp',
  'assets/images/visitplaces/6.jpg',
  'assets/images/visitplaces/7.jpg',
  'assets/images/visitplaces/8.jpg',
  'assets/images/visitplaces/9.jpg',

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
              items: banner.map((e) =>
                  Image(
                      image: AssetImage(e),
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
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: width * 0.4,
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    child: Image.asset(MyData[index].image,
                                      fit: BoxFit.fitHeight,),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:[
                                        Text(MyData[index].title,
                                            style: TextStyle(fontSize: 16.0,
                                            fontWeight: FontWeight.w500,)),
                                        SizedBox(height: 10,),
                                        Container(width: width * 0.5,
                                            child: Text(MyData[index].desc, style: TextStyle(fontSize: 14.0,))),
                                        SizedBox(height: 15,),
                                        RatingBar.builder(
                                          initialRating: 4,
                                          itemSize: 20,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber,),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Row(children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 16,
                                              color: kPrimaryColor,
                                            ),
                                            const SizedBox(width: 5,),
                                            InkWell(
                                              child: Text('Location',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.grey.withOpacity(0.9))),
                                              onTap: () => launch('${MyData[index].location}'),
                                            ),
                                          ],),
                                        ),

                                      ]),
                                ),

                              ]

                          ),
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

