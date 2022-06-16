import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/ProductsModel.dart';
import 'package:tourista/model/bannerModel.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';


class products_Screen extends StatelessWidget {
  String providerId;
  String providerName;
  String catgory;

  products_Screen(this.providerId,this.providerName,this.catgory);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<ProductsModel> Items = [];
    List<bannerModel> bannersList = [
      bannerModel(
        providerName: 'bazaars',
        banners: [
          'https://www.egypttoursportal.com/images/2020/12/The-Markets-and-Bazaars-of-Egypt-Shopping-In-Egypt-Egypt-Tours-Portal.jpg',
          'https://www.egypttoday.com/siteimages/Larg/34678.jpg',
          'https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/41668/cms/569321/940x500-1-50-4f9299dd25ebe92809d1e837b13122ff.jpg',
          'https://cdn.theculturetrip.com/wp-content/uploads/2021/07/bcfkpd-e1626092899232.jpg',
        ]
      ),
      bannerModel(
        providerName: 'restaurants',
        banners: [
          'https://dq5r178u4t83b.cloudfront.net/wp-content/uploads/sites/23/2016/10/24142956/gallery_elgezirah_La-Palmeraie-restaurant-Copy.jpg',
          'https://s7d2.scene7.com/is/image/ritzcarlton/RCCAIRO_00056?\$XlargeViewport100pct\$',
          'https://scoopempire.com/wp-content/uploads/2017/07/18556028_1360371480685328_5571738729549392989_n.jpg',
        ]
      ),
      bannerModel(
        providerName: 'DailyServices',
        banners: [
          'https://i.pinimg.com/originals/3a/f2/32/3af232e4fec20475bca820475f9fcbb5.jpg',
          'https://previews.123rf.com/images/sabelskaya/sabelskaya1908/sabelskaya190800461/128947875-supermarket-store-interior-with-goods-and-buyers-characters-the-flat-cartoon-vector-illustration-big.jpg',
        ]
      )
    ];
    List<String> banners = [];
    for(var i = 0 ; i < bannersList.length ; i++ ){
      if (bannersList[i].providerName == catgory){
        banners = bannersList[i].banners!;
      }
    }
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
          body: builderWidget(Items,width,height,banners),
        );
      },

    );
  }

  Widget builderWidget(List<ProductsModel> model,double width,double height, List<String> banner) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              items: banner
                  .map(
                    (e) =>
                    Image(
                      image: NetworkImage(e),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
              )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
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
                childAspectRatio: height  / width * 0.35,
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

