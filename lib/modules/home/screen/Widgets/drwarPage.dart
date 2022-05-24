import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'package:tourista/modules/splash/login/login_screen.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';

class Drwer extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel = AppCubit.get(context).model;
        return Drawer(
          child: Column(
            children: [
              Container (
                height: 180,
                width: 400,
                color: Color(-1088543194),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.center ,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height : 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0))
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage('${userModel?.image}')
                      ),
                    ),
                    Text('${userModel?.name}',style: s3,),
                    Text('${userModel?.email}',style: s4,),
                    Text('Balance : ${userModel?.balance} \$ ',style: s4,),

                  ],),),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                          leading: Icon(Icons.assignment_turned_in_outlined,size: 30,color: Color(-1088543194),),
                          title: Text("my Activity", style: s1,),
                          onTap:(){
                            AppCubit.get(context).bookTrip(price: 100, balance: AppCubit.get(context).model!.balance, details: 'Tripfksadj', time: DateTime.now());
                          }
                      ),
                    ),
                    Divider(height: 10,
                      thickness: 1,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                          leading: Icon(Icons.favorite,size: 30,color: Color(-1088543194),),
                          title: Text("Favourite", style: s1,),
                          onTap:(){

                          }
                      ),
                    ),
                    Divider(height: 10,
                      thickness: 1,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                          leading: Icon(Icons.settings,size: 30,color: Color(-1088543194),
                          ),
                          title: Text("Settings", style: s1,),
                          onTap:(){ /**Navigator.pop(context);**/}
                      ),
                    ),
                    Divider(height: 10,
                      thickness: 1,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),

                      child: ListTile(
                          leading: Icon(Icons.star_rate_outlined,size: 30,color: Color(-1088543194),),
                          title: Text(" Rate Us", style: s1,),
                          onTap:(){ }
                      ),

                    ),
                    Divider(height: 10, thickness: 1,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),

                      child: ListTile(
                          leading: Icon(Icons.share,size: 30,color:Color(-1088543194),),
                          title: Text(" Refer a Friend", style: s1,),
                          onTap:(){ }
                      ),

                    ),
                    Divider(height: 10,
                      thickness: 1,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                          leading: Icon(Icons.help,size: 30,color:Color(-1088543194),),
                          title: Text(" help ", style: s1,),
                          onTap:(){ }
                      ),

                    ),
                    Divider(height: 10, thickness: 1,),

                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),

                      child: ListTile(
                          leading: Icon(Icons.logout,size: 30,color:Color(-1088543194),),
                          title: Text(" log out", style: s1,),
                          onTap:(){
                            CacheHelper.removeData(key: 'uId');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                                  (Route<dynamic> route) => false,
                            );



                          }
                      ),

                    ),
                    Divider(height: 10, thickness: 1,),


                  ],

                ),
              )
            ],
          ),
        );
      },

    );
  }
}

