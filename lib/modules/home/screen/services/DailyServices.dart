import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class DailyS {
  late final int id;
  late final String title, image;
  bool? isFavourite;

  DailyS({
    required this.id,
    required this.title,
    required this.image,
    this.isFavourite,
  });
}

List<DailyS> myDummy = [
  DailyS(
    id: 0,
    title: "pharmacy",
    image: "assets/images/pharmacy.jpg",
    isFavourite: false,
  ),
  DailyS(
    id: 1,
    title: " market ",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    isFavourite: false,

  ),
  DailyS(
    id: 2,
    title: "moll",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    isFavourite: false,

  ),
  DailyS(
    id: 3,
    title: "Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    isFavourite: false,

  ),
  DailyS(
    id: 4,
    title: "Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    isFavourite: false,

  ),
  DailyS(
    id: 5,
    title: "Bazzars",
    image: "assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg",
    isFavourite: false,

  ),
];

class DailyServices extends StatelessWidget {

  List<IconData> faouriteIcons = [
    Icons.favorite_outline,
    Icons.favorite_outline,
    Icons.favorite_outline,
    Icons.favorite_outline,
    Icons.favorite_outline,
    Icons.favorite_outline,
    Icons.favorite_outline,
  ];
  List<bool> isPressed = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder : (context,state){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              height: 210,
              width: 250,
              child: ListView(
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
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 150,
                                      height: 120,
                                      child: Stack(children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            myDummy[index].image,
                                            height: 120.0,
                                            width: 120.0,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 120,
                                          alignment: AlignmentDirectional.topEnd,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            child: IconButton(
                                              onPressed:(){
                                                if(myDummy[index].id == index) {
                                                  AppCubit.get(context).changeIcon(index: index,faouriteIcons: faouriteIcons, isPressed: isPressed);
                                                }
                                              } ,
                                              icon:Icon(
                                                faouriteIcons[index],
                                                color: Colors.red,
                                                size: 17,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])),
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 15,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                Container(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Text(myDummy[index].title,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 130,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    elevation: 5.0,
                                    child: Text(
                                      "more details",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                    color: Color(-1088543194),
                                    onPressed: () {},
                                  ),
                                )
                              ]),
                        );
                      }),
                ],
              )),
        );
      },
    );
  }
}
