import 'package:flutter/material.dart';
class row extends StatelessWidget {
  const row({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(width: 20,),
            Container( child: Text("offers",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.topStart,height: 40,width: 130,),
            SizedBox(width: 50,),
            Container( child: Text("(20% off)",style:TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.topStart,height: 20,width:130 ,)],

    );


  }
}
