import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tourista/hotel/calendar_popup_view.dart';
import 'package:tourista/hotel/hotel_list_view.dart';
import 'package:tourista/hotel/rooms_popup_view.dart';
import 'package:tourista/model/hotelDetialsModel.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'hotel_app_theme.dart';

class HotelHomeScreen extends StatefulWidget {
  @override
  _HotelHomeScreenState createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<hotelModel> Model = [
    hotelModel(
      id: 1,
      pricePerNight: '19',
      title: 'Castle Hostel, cairo',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipN-JkGcagbyiI9T3mSTvCnKQJeCn2-zoUYkGaFe=w408-h306-k-no',
      location: 'https://g.page/castle-hostel-cairo?share',
      reviews: 139,
      city: 'cairo',
      rating: 4.2,
    ),
    hotelModel(
      id: 2,
      pricePerNight: '39',
      title: 'Cairo House Hotel',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOSuPqN_ccotlKgXucQDjdnA9kb0KAyiT53PYVg=w408-h306-k-no',
      location: 'https://goo.gl/maps/AZ73xCjz5HYvJbQK9',
      reviews: 43,
      city: 'cairo',
      rating: 3.9,
    ),
    hotelModel(
      id: 3,
      pricePerNight: '98',
      title: 'Arabia Azur Resort',
      image:
          'https://lh5.googleusercontent.com/proxy/RP_UHMZTqXc4HLKO50BxcShabx9zu3KUqyB8g8GovqZ5qTIoPTVWkZghBNNbVLZAx3r_Kt1MQdkiUu90mrd-tTlw14ZARZ77QyS6XvUkpIAVj_ioUgXiIKgS36F9Dt4v6rRJxS3-RSBBMaiRmUmzqmqdMLdHBA=w413-h240-k-no',
      location: 'https://goo.gl/maps/pH7EQ6nmfVwURL6PA',
      reviews: 4533,
      city: 'Hurghada',
      rating: 4.4,
    ),
    hotelModel(
      id: 4,
      pricePerNight: '50',
      title: 'Giftun Azur Beach Resort',
      image:
          'https://exp.cdn-hotels.com/hotels/45000000/44090000/44087000/44086918/16f1da52_z.jpg?impolicy=fcrop&w=1000&h=666&q=medium',
      location: 'https://goo.gl/maps/ccSjbXwfMv7Rz66v5',
      reviews: 3797,
      city: 'Hurghada',
      rating: 4,
    ),
    hotelModel(
      id: 5,
      pricePerNight: '39',
      title: 'Ladybird - Golden Europe Hotel',
      image:
          'https://lh5.googleusercontent.com/proxy/Yb49uIhBhoKyP3-0njVHL5hkhK1evVLRAP4WeCvoCdkjgqc-j4ar5BOnTsRgjG6_eaXbmWghnHqmsZf26UH-_DF6gNAZIuYyhimsMJzrJ6i52qltV3Q4A5H3NVOEri3IDuc6mkHyxGirQ_6KYE5Bv4qGtG0qkUU=w408-h443-k-no',
      location: 'https://g.page/GoldenEuropeHotel?share',
      reviews: 313,
      city: 'dahab',
      rating: 4.3,
    ),
    hotelModel(
      id: 6,
      pricePerNight: '73',
      title: 'Tirana Dahab Resort',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipP1jozBNMEffmvrurDpDHhL6aR--_jm693tSVig=w408-h306-k-no',
      location: 'https://goo.gl/maps/nafFVYAVQ62s7sGi7',
      reviews: 2000,
      city: 'dahab',
      rating: 4.2,
    ),
    hotelModel(
      id: 7,
      pricePerNight: '21',
      title: 'Royal Grand Sharm',
      image:
          'https://lh5.googleusercontent.com/proxy/jChSMNyV6I17koSa5j5pXcoplQqVZEroU2EQWnjuOqQPf4e7vU23s-JqVI3_O1Y-2LnnzvB2MJiHQwHfuN2cUxVCwVq9JfD8vwxaAeshghCct_H2qN2hrzNBWOqeRLj059B0IY2tBOPyX7atvTs_VSKO2oVrQTQ=w408-h279-k-no',
      location: 'https://goo.gl/maps/pFjVEdmBHJDYPfBx5',
      reviews: 3731,
      city: 'Sharm El-Sheikh',
      rating: 4.3,
    ),
    hotelModel(
      id: 8,
      pricePerNight: '106',
      title: 'Mövenpick Resort Taba',
      image:
      'https://lh5.googleusercontent.com/p/AF1QipOX7qrB3ykEANRNsqwoehZTRz2oRc-Y6KkYIbWJ=w408-h272-k-no',
      location: 'https://g.page/movenpick-taba?share',
      reviews: 1477,
      city: 'taba',
      rating: 4.7,
    ),
    hotelModel(
      id: 9,
      pricePerNight: '21',
      title: 'Basma hotel',
      image: 'https://lh5.googleusercontent.com/p/AF1QipPPEPbtXP1AGtAHic2l4O7Nu7bLF8b8j7FlmiWb=w408-h272-k-no',
      location: 'https://g.page/Basmahotel?share',
      reviews: 1441,
      city: 'aswan',
      rating: 3.8,
    ),
  ];
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
    List<hotelModel> NewModel = Model;
    if (dropdownvalue == 'cairo') {
      NewModel = [];
      for (var i = 0; i < Model.length; i++) {
        if (Model[i].city == 'cairo') {
          NewModel.add(Model[i]);
        }
      }
    }
    else if (dropdownvalue == 'Hurghada') {
      NewModel = [];
      for (var i = 0; i < Model.length; i++) {
        if (Model[i].city == 'Hurghada') {
          NewModel.add(Model[i]);
        }
      }
    }
    else if (dropdownvalue == 'dahab') {
      NewModel = [];
      for (var i = 0; i < Model.length; i++) {
        if (Model[i].city == 'dahab') {
          NewModel.add(Model[i]);
        }
      }
    }
    else if (dropdownvalue == 'Sharm El-Sheikh') {
      NewModel = [];
      for (var i = 0; i < Model.length; i++) {
        if (Model[i].city == 'Sharm El-Sheikh') {
          NewModel.add(Model[i]);
        }
      }
    }
    else if (dropdownvalue == 'aswan') {
      NewModel = [];
      for (var i = 0; i < Model.length; i++) {
        if (Model[i].city == 'aswan') {
          NewModel.add(Model[i]);
        }
      }
    }
    else if (dropdownvalue == 'taba') {
      NewModel = [];
      for (var i = 0; i < Model.length; i++) {
        if (Model[i].city == 'taba') {
          NewModel.add(Model[i]);
        }
      }
    }
    else if (dropdownvalue == 'All') {
      NewModel = Model;
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
                                    getTimeDateUI(),
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
                              return HotelListView(
                                callback: () {},
                                hotelData: NewModel[index],
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



  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      // setState(() {
                      //   isDatePopupOpen = true;
                      // });
                      showDemoDialog(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Choose date',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      showRoomsDialog(context: context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Number of Rooms',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.grey.withOpacity(0.8)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '$Rooms Room - $Adults Adults',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }
  void showRoomsDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => RoomsPopupView(
        barrierDismissible: true,
        onApplyClick: (String Room,String Adult) {
          setState(() {
            Rooms = Room;
            Adults = Adult;
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
