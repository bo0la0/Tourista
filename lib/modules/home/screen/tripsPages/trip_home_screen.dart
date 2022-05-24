import 'package:flutter/material.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/modules/home/screen/tripsPages/trip_app_theme.dart';
import 'package:tourista/modules/home/screen/tripsPages/trip_list_view.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';


class TripHomeScreen extends StatefulWidget {
  @override
  _TripHomeScreenState createState() => _TripHomeScreenState();
}

class _TripHomeScreenState extends State<TripHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  final ScrollController _scrollController = ScrollController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  String Rooms = '1';
  String Adults = '1';

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Trips> NewModel = AppCubit.get(context).trips;
    if (dropdownvalue == 'cairo') {
      NewModel = [];
      for (var i = 0; i < AppCubit.get(context).trips.length; i++) {
        if (AppCubit.get(context).trips[i].tripLocation == 'cairo') {
          NewModel.add(AppCubit.get(context).trips[i]);
        }
      }
    }
    else if (dropdownvalue == 'Hurghada') {
      NewModel = [];
      for (var i = 0; i < AppCubit.get(context).trips.length; i++) {
        if (AppCubit.get(context).trips[i].tripLocation == 'Hurghada') {
          NewModel.add(AppCubit.get(context).trips[i]);
        }
      }
    }
    else if (dropdownvalue == 'dahab') {
      NewModel = [];
      for (var i = 0; i < AppCubit.get(context).trips.length; i++) {
        if (AppCubit.get(context).trips[i].tripLocation == 'dahab') {
          NewModel.add(AppCubit.get(context).trips[i]);
        }
      }
    }
    else if (dropdownvalue == 'Sharm El-Sheikh') {
      NewModel = [];
      for (var i = 0; i < AppCubit.get(context).trips.length; i++) {
        if (AppCubit.get(context).trips[i].tripLocation == 'Sharm El-Sheikh') {
          NewModel.add(AppCubit.get(context).trips[i]);
        }
      }
    }
    else if (dropdownvalue == 'aswan') {
      NewModel = [];
      for (var i = 0; i < AppCubit.get(context).trips.length; i++) {
        if (AppCubit.get(context).trips[i].tripLocation == 'aswan') {
          NewModel.add(AppCubit.get(context).trips[i]);
        }
      }
    }
    else if (dropdownvalue == 'taba') {
      NewModel = [];
      for (var i = 0; i < AppCubit.get(context).trips.length; i++) {
        if (AppCubit.get(context).trips[i].tripLocation == 'taba') {
          NewModel.add(AppCubit.get(context).trips[i]);
        }
      }
    }
    else if (dropdownvalue == 'All') {
      NewModel = AppCubit.get(context).trips;
    }


    return Theme(
      data: HotelAppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
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
                                          parent: animationController!,
                                          curve: Interval(
                                              (1 / count) * index, 1.0,
                                              curve: Curves.fastOutSlowIn)));
                              animationController?.forward();
                              return TripsListView(
                                callback: () {},
                                tripData: NewModel[index],
                                animation: animation,
                                animationController: animationController!,
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
  }



  String dropdownvalue = 'All';
  var items = [
    'All',
    'cairo',
    'Hurghada',
    'Sharm El-Sheikh',
    'dahab',
    'taba',
    'aswan',
  ];
  Widget getLocationBarUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Select location :',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 0, bottom: 0),
              child: DropDownButton(selectedValue: dropdownvalue, items: items,onChanged: (value){
                    setState(() {
                      dropdownvalue = value!;
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }

}
