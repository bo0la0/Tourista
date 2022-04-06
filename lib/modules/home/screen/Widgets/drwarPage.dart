
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourista/model/style/TextStyle.dart';

class Drwer extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

       child: Column(

         children: [
           Container(
             height: 200,
             width: 400,
             color: Color(-1088543194),
             child: Column(
               crossAxisAlignment:CrossAxisAlignment.center ,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   alignment: AlignmentDirectional.centerEnd,
                   child: IconButton(
                     onPressed: (){},
                     icon: new Icon(
                       Icons.manage_accounts_outlined,
                       size: 35,
                       color: Colors.white,
                     ),),),
                 Container(
                   height : 100,
                   width: 100,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(4.0))
                   ),
                   child: CircleAvatar(
                     backgroundColor: Colors.white,
                     backgroundImage: NetworkImage("https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                   ),
                 ),
                 Text("sabah mohamed ",style: s3,),
                 Text("sabahmohamed1478@gmail.com ",style: s4,),

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
                       leading: Icon(Icons.favorite,size: 30,color: Color(-1088543194),),
                       title: Text("Favourite", style: s1,),
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
                       onTap:(){ }
                   ),

                 ),
                 Divider(height: 10, thickness: 1,),


               ],

             ),
           )
         ],
       ),
    );

  }
}