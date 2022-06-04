

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/modules/home/screen/myactivity/trip_app_theme.dart';
import 'package:tourista/modules/home/screen/myactivity/trip_list_view.dart';
import 'package:tourista/shared/components/constants.dart';

import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class MyActivity extends StatefulWidget {
  @override
  _MyActivityState createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity>
    with TickerProviderStateMixin {
  AnimationController? animy;
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    animy = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animy?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Trips> NewModel = AppCubit.get(context).bookedTrips;

    return  BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){

        if (state is cancelTripSeatSuccessState){
          NewModel = AppCubit.get(context).bookedTrips;
        }
        if (state is AppGetUserSuccessState){
          NewModel = AppCubit.get(context).bookedTrips;
        }
        if(state is updatebookedlist){
          NewModel = AppCubit.get(context).bookedTrips;
        }
      } ,
      builder :(context,state){

        return Theme(
          data: HotelAppTheme.buildLightTheme(),
          child: Container(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                title: Text('My Activity'),
              ),
              body: Stack(
                children: <Widget>[
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(
                      children: <Widget>[
                        //getAppBarUI(),
                        Expanded(
                          child: NestedScrollView(
                            controller: _scrollController,
                            headerSliverBuilder:
                                (BuildContext context, bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: <Widget>[
                                            getLocationBarUI(),
                                          ],
                                        );
                                      }, childCount: 1),
                                ),
                              ];
                            },
                            body: Container(
                              color:
                              HotelAppTheme.buildLightTheme().backgroundColor,
                              child: ListView.builder(
                                itemCount: NewModel.length,
                                padding: const EdgeInsets.only(top: 8),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final int count =
                                  NewModel.length > 10 ? 10 : NewModel.length;
                                  final Animation<double> animation =
                                  Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                          parent: animy!,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                                  animy?.forward();
                                  return MyActivitylistview(
                                    callback: () {},
                                    tripData: NewModel[index],
                                    animation: animation,
                                    animationController: animy!,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
  Widget getLocationBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
      child: Container(),
    );
  }





}
