import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class tripsPages extends StatelessWidget {
  final Trips model ;

  tripsPages({ required this.model});
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getTouristinTrips(tripId: model.tripId!);
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context, state) {
        if(state is updatebookedlist){
          Navigator.pop(context);
        }

      },
      builder: (context,state){

        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                  foregroundDecoration: BoxDecoration(
                      color: Colors.black26
                  ),
                  height: 400,
                  width: double.infinity,
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
                                          text: "${model.fromTime} to ${model.endTime}",
                                        //{DateFormat.yMEd().add_jms().format(model.date!.toDate())
                                      )
                                    ]), style: TextStyle(color: Colors.grey, fontSize: 20.0),)
                                  ],
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text("\$ ${model.price}", style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0
                                  ),),
                                  Text("/per seat",style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey
                                  ),)
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          Row(children: [
                            Text('Total seats:'),
                            Padding(
                              padding: const EdgeInsets.only(left: 8 ),
                              child: Container(
                                child: Counter(
                                  min: 1,
                                  max: 10,
                                  bound: 1,
                                  step: 1,
                                  onValueChanged: (num){AppCubit.get(context).seats = int.parse(num.toString());
                                    AppCubit.get(context).TotalPrice(price: model.price, seats: AppCubit.get(context).seats);},
                                ),
                              ),
                            ),
                            Text('Total amount : ${AppCubit.get(context).total ?? model.price}',
                            style: TextStyle(fontSize: 12),),
                          ],),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            child:
                            ConditionalBuilder(
                              condition: state is! BookingTripLoadingState ,
                              builder: (BuildContext) => RaisedButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                color: kPrimaryColor,
                                textColor: Colors.white,
                                child: Text("Book Now", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 32.0,
                                ),
                                onPressed: () async{
                                  Position position = await AppCubit.get(context).getGeoLocationPosition();
                                  String Link = 'https://www.google.com/maps/search/?api=1&query=${position.latitude}%2C${position.longitude}';
                                  // await AppCubit.get(context).GetAddressFromLatLong(position);
                                  // get address
                                  AppCubit.get(context).bookTrip(
                                      tripId: model.tripId,
                                      Address: Link,
                                      price:model.price,
                                      balance :AppCubit.get(context).model!.balance,
                                      details: 'Trip',
                                      tripName: model.shortdesc,
                                      tripImage: model.tripImg,
                                      time: DateTime.now(),
                                      seats: AppCubit.get(context).seats,
                                  );
                                },
                              ),
                              fallback: (BuildContext) => Center(child: CircularProgressIndicator()),
                            ),
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
    );
  }
}