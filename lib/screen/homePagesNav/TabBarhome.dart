import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourista/screen/chatUser/chat_screen.dart';
import 'package:tourista/screen/hotels/home.dart';
import 'package:tourista/screen/services/BODYservices.dart';
import 'package:tourista/screen/tripsPages/BODY.dart';
import 'package:tourista/screen/Widgets/drwarPage.dart';
import 'homeVisitScreens/homeVisit.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home> {
  int _selectedIndexForTabBar = 0;

  static List<Widget> _listOfIconsForTabBar = <Widget>[
    homevisit(),
    BODY(),
    Home_Hotel(),
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
    var _controller;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: Drwer(),
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Color(-1088543194),
            title: Text("Tourista",style: TextStyle(fontSize: 20),),
            elevation: 0.8,
            actions: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  iconSize: 30,
                  alignment: Alignment.centerRight,
                  onPressed: () {

                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30,
                  alignment: Alignment.center,
                  onPressed: () {

                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.message),
                  iconSize: 30,
                  alignment: Alignment.centerLeft,
                  onPressed: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder:(context) => ChatScreen(),
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
                        color: Colors.white,
                        height: 60,

                        child: TabBar(
                            onTap: _onItemTappedForTabBar,
                            unselectedLabelColor: Colors.black54,
                            labelColor: Colors.white,
                            indicator: BoxDecoration(
                             borderRadius: BorderRadius.circular(2),
                             color: Color(-1088543194),),
                         tabs: [
                          Center(child: Text("places to visit",)),
                          Center(child: Text("Trips",)),
                          Center(child: Text("Hotels",)),
                          Center(child: Text("services",)),
                         ],
                        isScrollable: true,
                        indicatorColor: Colors.grey,
                       automaticIndicatorColorAdjustment: false,
                       unselectedLabelStyle: TextStyle(fontSize: 15)),
                   ),
              ]),
                preferredSize: const Size.fromHeight(70)
            ),),
          body: _listOfIconsForTabBar.elementAt(_selectedIndexForTabBar ),

        ));
  }}