import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/style/TextStyle.dart';
import 'package:tourista/modules/home/screen/myactivity/trip_home_screen.dart';
import 'package:tourista/modules/home/screen/reports/feedback.dart';
import 'package:tourista/modules/home/screen/reports/report.dart';
import 'package:tourista/modules/splash/login/login_screen.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';
import 'package:tourista/shared/network/local/cache_helper.dart';

class Drwer extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel = AppCubit.get(context).model;
        return Drawer(
          backgroundColor: Colors.lightBlueAccent[50],
          child: Column(
            children: [
              Container (
                height: 180,
                width: 400,
                color: kPrimaryColor,
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
                            navigateTo(context, MyActivity());

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
                          leading: Icon(Icons.star_rate_outlined,size: 30,color: Color(-1088543194),),
                          title: Text("FeedBack", style: s1,),
                          onTap:(){
                            navigateTo(context, FeedBack());

                          }
                      ),

                    ),
                    Divider(height: 10, thickness: 1,),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      margin: EdgeInsets.all(10),

                      child: ListTile(
                          leading: Icon(Icons.report,size: 30,color:Color(-1088543194),),
                          title: Text(" Report ", style: s1,),
                          onTap:(){
                            navigateTo(context, Report());
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

