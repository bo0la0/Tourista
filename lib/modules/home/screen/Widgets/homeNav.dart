import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class homeNav extends StatelessWidget {
  const homeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var Cubit = AppCubit.get(context);
        return Scaffold(
          body: Cubit.screens[Cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home,size: 30,),),
              BottomNavigationBarItem(
                label: "camera",
                icon: Icon(Icons.camera_alt_outlined, size: 30,),),
              BottomNavigationBarItem(
                label: "scan", icon: Icon(Icons.qr_code_2_outlined,size: 35,),),
              // BottomNavigationBarItem(
              //   label: "Services", icon: Icon(Icons.favorite_border_outlined,size: 30,color: Color(-1088543194)),
              // ),
              BottomNavigationBarItem(
                label: "account", icon: Icon(Icons.perm_identity_outlined,size: 30,),
              ),
            ],
            currentIndex: Cubit.currentIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey.shade700,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
            onTap: (index){
              Cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }

}




