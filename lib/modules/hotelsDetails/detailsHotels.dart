import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/model/style/TextStyle.dart';
//import 'package:tourista/modules.home.screen/hotels/modules.hotelsDetails/productModel.dart';

import 'package:tourista/shared/components/constants.dart';

class DetaisHotels extends StatefulWidget {
  String? title, text, price, image, num1, num2;
  int? id;
  DetaisHotels(
      {required this.id,
      required this.price,
      required this.text,
      required this.image,
      required this.num1,
      required this.num2,
      required this.title});

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
            Navigator.pop(
              context,
            );
          },
        ),
        backgroundColor: kPrimaryColor,
        title: Text("Details"),
      ),
      body: Expanded(
        child: Container(
            width: 400,
            child: ListView(scrollDirection: Axis.vertical, children: [
              Container(
                height: 950,
                width: 400,
                child: Column(children: [
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
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                (widget.image!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13.0,
                        ),
                        Container(
                          width: 350,
                          height: 30,
                          child: Text(
                            (widget.title!),
                            style: s2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 320,
                    child: Text(
                      'Details',
                      style: s1,
                    ),
                  ),
                  Container(
                    width: 320,
                    height: 200,
                    child: Text(
                      (widget.text!),
                      style: s1,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                      width: 330,
                      child: Text(
                        " Amenities",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(-1088543194),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.contactless_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "free wifi",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(-1088543194),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.live_tv_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Live Tv",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(-1088543194),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.kitchen_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            " AC unit",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(-1088543194),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.fitness_center_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            " GYM",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Color(-1088543194),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.sports_bar_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            " BAR",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Price",
                                style: s1,
                              ),
                            )),
                        Container(
                            width: 160,
                            child: Text(
                              "Review",
                              style: s1,
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          width: 180,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text((widget.price!)),
                          )),
                      Row(
                        children: [
                          Container(width: 30, child: Text((widget.num1!))),
                          Container(
                            width: 80,
                            child: RatingBar.builder(
                              initialRating: 6,
                              itemSize: 15,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 4,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Container(width: 55, child: Text((widget.num2!))),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    alignment: AlignmentDirectional.bottomEnd,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      elevation: 5.0,
                      child: Text(
                        "Book now ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      color: Color(-1088543194),
                      onPressed: () {},
                    ),
                  )
                ]),
              )
            ])),
      ),
    );
  }
}
