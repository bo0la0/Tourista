import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tourista/modules/home/screen/services/categoriesScreen.dart';
import 'package:tourista/modules/home/screen/services/products_screen.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';


class RestuServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              height: height * 0.38,
              width: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.resturantservices.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.38,
                          width: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 150,
                                      height: 120,
                                      child: Stack(children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.network(
                                            cubit.resturantservices[index].image.toString(),
                                            height: 120.0,
                                            width: 120.0,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        // Container(
                                        //   height: 25,
                                        //   width: 120,
                                        //   alignment: AlignmentDirectional.topEnd,
                                        //   child: CircleAvatar(
                                        //     backgroundColor: Colors.white,
                                        //     child: IconButton(
                                        //       onPressed:(){
                                        //         if(cubit.resturantservices[index].id == index.toString()) {
                                        //           cubit.changeIcon(index: index,faouriteIcons: faouriteIcons,isPressed: isPressed);
                                        //         }
                                        //       } ,
                                        //        icon:Icon(
                                        //         faouriteIcons[index],
                                        //         color: Colors.red,
                                        //         size: 17,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ])),
                                ),
                                RatingBar.builder(
                                  initialRating: 5,
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
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Text(cubit.resturantservices[index].title.toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  child: Text('Location',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  onTap: ()=> launch('${cubit.resturantservices[index].location}'),
                                ),
                                SizedBox(height: 5,),
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
                                    onPressed: () {
                                      if(cubit.resturantservices != null){
                                        navigateTo(context, products_Screen(
                                            cubit.resturantservices[index].id.toString(),
                                            cubit.resturantservices[index].title.toString()),
                                        );}else{
                                        ShowToast(text: 'Bad Network');
                                      }
                                    },
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
