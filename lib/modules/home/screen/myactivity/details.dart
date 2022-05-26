
import 'package:flutter/material.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/shared/components/constants.dart';


class tripdetials extends StatelessWidget {
  final Trips model ;

  const tripdetials({ required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Colors.black26
              ),
              height: 400,
              child: Image.network(model.tripImg.toString(), fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.only(left: 18,bottom: 10),
                  child: Text(
                    "${model.shortdesc}",
                    style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                // Row(
                //   children: <Widget>[
                //     const SizedBox(width: 16.0),
                //     Container(
                //       padding: const EdgeInsets.symmetric(
                //         vertical: 8.0,
                //         horizontal: 16.0,
                //       ),
                //       decoration: BoxDecoration(
                //           color: Colors.grey,
                //           borderRadius: BorderRadius.circular(20.0)),
                //       child: Text(
                //         "${model.reviews} reviews",
                //         style: TextStyle(color: Colors.white, fontSize: 13.0),
                //       ),
                //     ),
                //     Spacer(),
                //     // IconButton(
                //     //   color: Colors.white,
                //     //   icon: Icon(Icons.favorite_border),
                //     //   onPressed: () {},
                //     // )
                //   ],
                // ),
                Container(
                  padding: const EdgeInsets.all(24.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text.rich(TextSpan(children: [
                                  WidgetSpan(
                                      child: Icon(Icons.access_time, size: 24.0, color: Colors.grey,)
                                  ),
                                  TextSpan(
                                      text: "${model.date?.toDate()}"
                                  )
                                ]), style: TextStyle(color: Colors.grey, fontSize: 20.0),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Text("Description".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0
                      ),),
                      const SizedBox(height: 20.0),
                      Text(
                        "${model.description}", textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0
                      ),),
                      // const SizedBox(height: 10.0),
                      // Text(
                      //   "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ratione architecto autem quasi nisi iusto eius ex dolorum velit! Atque, veniam! Atque incidunt laudantium eveniet sint quod harum facere numquam molestias?", textAlign: TextAlign.justify, style: TextStyle(
                      //     fontWeight: FontWeight.w300,
                      //     fontSize: 14.0
                      // ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text("DETAIL",style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}