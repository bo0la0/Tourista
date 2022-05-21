import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/ProductsModel.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';


class products_Screen extends StatelessWidget {
  String providerId;
  String providerName;

  products_Screen(this.providerId,this.providerName);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<ProductsModel> Items = [];

    for(var i = 0 ; i < AppCubit.get(context).productModel.length ; i++ ){
      if (AppCubit.get(context).productModel[i].providerId == providerId){
        Items.add(AppCubit.get(context).productModel[i]);
      }
    }
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context, states) {},
      builder:(context, states) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },),
            backgroundColor: kPrimaryColor,
            title: Text("${providerName}"),
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: kPrimaryLightColor,
            ),
          ),
          body: builderWidget(Items,width,height),
        );
      },

    );
  }

  Widget builderWidget(List<ProductsModel> model,double width,double height) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CarouselSlider(
            //   items: model.banners
            //       .map(
            //         (e) =>
            //         Image(
            //           image: NetworkImage(e.image),
            //           fit: BoxFit.cover,
            //           width: double.infinity,
            //         ),
            //   )
            //       .toList(),
            //   options: CarouselOptions(
            //     height: 200,
            //     viewportFraction: 1.0,
            //     enlargeCenterPage: false,
            //     initialPage: 0,
            //     enableInfiniteScroll: true,
            //     reverse: false,
            //     autoPlay: true,
            //     autoPlayInterval: Duration(seconds: 3),
            //     autoPlayAnimationDuration: Duration(seconds: 1),
            //     autoPlayCurve: Curves.fastOutSlowIn,
            //     scrollDirection: Axis.horizontal,
            //   ),
            // ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: height  / width * 0.5,
                children: List.generate(
                 model.length,
                      (index) => buildGridProduct(model[index]),
                ),
              ),
            ),
          ],
        ),
      );


  Widget buildGridProduct( ProductsModel model) =>
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage("${model.image}"),
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                // if (model.Id != 0)
                //   Container(
                //     color: Colors.red,
                //     padding: EdgeInsets.symmetric(
                //       horizontal: 5.0,
                //     ),
                //     child: Text(
                //       'DISCOUNT',
                //       style: TextStyle(
                //         fontSize: 8.0,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(
                        '${model.price}\$',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      // if (model.discount != 0)
                      //   Text(
                      //     '${model.oldPrice.round()}',
                      //     style: TextStyle(
                      //       fontSize: 10.0,
                      //       color: Colors.grey,
                      //       decoration: TextDecoration.lineThrough,
                      //     ),
                      //   ),
                      Spacer(),
                      // IconButton(
                      //   padding: EdgeInsets.zero,
                      //   icon: Icon(
                      //     Icons.favorite_border,
                      //     size: 14.0,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

