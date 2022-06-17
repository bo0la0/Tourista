import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourista/hotel/hotel_home_screen.dart';
import 'package:tourista/modules/chatUser/new_chat.dart';
import 'package:tourista/modules/home/screen/chatUser/chat_screen.dart';
import 'package:tourista/modules/home/screen/services/BODYservices.dart';
import 'package:tourista/modules/home/screen/Widgets/drwarPage.dart';
import 'package:tourista/modules/home/screen/tripsPages/trip_home_screen.dart';

import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'homeVisitScreens/homeVisit.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home> {
  int _selectedIndexForTabBar = 0;

  static List<Widget> _listOfIconsForTabBar = <Widget>[
    homevisit(),
    TripHomeScreen(),
    HotelHomeScreen(),
    BodyServices(),
  ];
  TextEditingController _controller = TextEditingController();
  void _onItemTappedForTabBar(int index) {
    setState(() {
      _selectedIndexForTabBar = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var _controller;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: Drwer(),
          appBar:PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: AppBar(
            toolbarHeight: height * 0.1,
            backgroundColor: kPrimaryColor,
            title: Text("Tourista",style: TextStyle(fontSize: 20),),
            elevation: 0.8,
            actions: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.message),
                  iconSize: 30,
                  alignment: Alignment.centerLeft,
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context) => newchat(tripData: AppCubit.get(context).ListchatRoom,),
                      ),
                    );
                    },
                ),
              ),],
            bottom: PreferredSize(
                child: Column(
                    children: [
                   /*   Container(
                        padding: const EdgeInsets.all(1),
                        alignment: Alignment.center,
                        height: 70,
                        child: Container(
                          color: Colors.white,
                          width: 300,
                          height: 40,
                          child: TextFormField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "Search",
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                          ),),
                      ),*/
                      SizedBox(height:10,),
                      Container(
                        //color: Colors.white,

                        height: 50,
                        width: double.infinity,
                        /*decoration: BoxDecoration(
                          height: 60,
                          width: double.infinity,
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),*/
                        child: TabBar(

                            onTap: _onItemTappedForTabBar,
                            unselectedLabelColor: Colors.white54,
                            labelColor: Colors.black87,
                            indicator: BoxDecoration(
                              color: Colors.white,
                             borderRadius: BorderRadius.circular(40),
                            // color: kPrimaryColor,
                                ),
                         tabs: [
                          Center(child: Text("places to visit",)),
                          Center(child: Text("Trips",)),
                          Center(child: Text("Hotels",)),
                          Center(child: Text("services",)),
                         ],
                        isScrollable: true,
                        indicatorColor: kPrimaryColor,
                       automaticIndicatorColorAdjustment: false,
                       unselectedLabelStyle: TextStyle(fontSize: 15)),
                   ),
              ]),
                preferredSize: const Size.fromHeight(70)
            ),),),
          body: _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar ),

        ));
  }}