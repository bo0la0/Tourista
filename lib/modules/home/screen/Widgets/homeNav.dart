import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourista/modules/home/screen/homePagesNav/camera.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/pages/profile_page.dart';
import 'package:tourista/modules/home/screen/homePagesNav/favouritScreen/favourite.dart';
import 'package:tourista/modules/home/screen/homePagesNav/TabBarhome.dart';
import 'package:tourista/modules/home/screen/homePagesNav/scan_qr.dart';



class homeNav extends StatefulWidget {
  const homeNav({Key? key}) : super(key: key);

  @override
  _homeNavState createState() => _homeNavState();
}

class _homeNavState extends State<homeNav> {
  int _selectedIndex=0;
  List <Widget> _listoption =<Widget>
  [
    home(),
    camera(),
    Scan_qr(),
    favourite(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listoption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home,size: 30,),),
          BottomNavigationBarItem(
            label: "camera",
            icon: Icon(Icons.camera_alt_outlined, size: 30,color: Color(-1088543194)),),
          BottomNavigationBarItem(
            label: "scan", icon: Icon(Icons.qr_code_2_outlined,size: 35,color: Color(-1088543194)),),
          BottomNavigationBarItem(
            label: "faourite", icon: Icon(Icons.favorite_border_outlined,size: 30,color: Color(-1088543194)),
          ),
          BottomNavigationBarItem(
            label: "my account", icon: Icon(Icons.perm_identity_outlined,size: 30,color: Color(-1088543194)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        onTap: _changItem,
      ),
    );
  }

  void _changItem(int value) {
    setState(() {
       _selectedIndex=value;

    });
  }
}

