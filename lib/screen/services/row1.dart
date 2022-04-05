import 'package:flutter/material.dart';
class ROW1 extends StatelessWidget {
  const ROW1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
        children: [
          SizedBox(width: 20,),
          Container( child: Text("Restaurants",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.topStart,height: 40,width: 130,),
          SizedBox(width: 50,),
          Container( child: Text("(20% off)",style:TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.topStart,height: 20,width:130 ,)],
        ),
      ),
      Container( child: Text("Restaurants near you",style:TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),height: 20,width: 320,),

    ],);
    

  }
}
