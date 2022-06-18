import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class tripdetials extends StatelessWidget {
  final Trips model;
  final int Seats;

  const tripdetials({required this.model, required this.Seats});
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).seats = 1;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if(state is cancelTripSeatSuccessState || state is cancelTripSuccessState){
          Navigator.pop(context);}
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                  foregroundDecoration: BoxDecoration(color: Colors.black26),
                  height: 400,
                  child: Image.network(model.tripImg.toString(),
                      fit: BoxFit.cover)),
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 250),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, bottom: 10),
                      child: Text(
                        "${model.shortdesc}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
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
                                    Text.rich(
                                      TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.access_time,
                                          size: 24.0,
                                          color: Colors.grey,
                                        )),
                                        TextSpan(
                                          text: "${model.fromTime} to ${model.endTime}")
                                        //${DateFormat.yMEd().add_jms().format(model.date!.toDate())}
                                      ]),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          if(Seats > 1)
                            Row(
                            children: [
                              Text('Total seats:'),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 14),
                                child: Container(
                                  child: Counter(
                                    min: 1,
                                    max: Seats == 1 ? 10 : Seats,
                                    bound: 1,
                                    step: 1,
                                    initial: Seats,
                                    onValueChanged: (num) {
                                      AppCubit.get(context).seats = num;
                                      AppCubit.get(context).TotalPrice(
                                          price: model.price,
                                          seats: AppCubit.get(context).seats);
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                  'Total amount : ${AppCubit.get(context).total ?? model.price}',style: TextStyle(fontSize: 12),),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: double.infinity,
                            child: ConditionalBuilder(
                              condition: state is! cancelTripLoadingState,
                              builder: (BuildContext) => RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                color: Colors.red,
                                textColor: Colors.white,
                                child: Text(
                                  "cancel",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 32.0,
                                ),
                                onPressed: () {
                                  if (AppCubit.get(context).seats == Seats) {
                                    AppCubit.get(context).cancelTrip(
                                        TripId: '${model.tripId}',
                                        price: model.price,
                                        seats: Seats);
                                  } else {
                                    AppCubit.get(context).cancelSeat(
                                        TripId: '${model.tripId}',
                                        price: model.price,
                                        cancelseats: AppCubit.get(context).seats,
                                        seats: Seats
                                    );

                                  }
                                },
                              ),
                              fallback: (BuildContext) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Text(
                            "Description".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14.0),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            "${model.description}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14.0),
                          ),
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
                  title: Text(
                    "DETAIL",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
