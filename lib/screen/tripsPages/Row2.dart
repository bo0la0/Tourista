import 'package:flutter/material.dart';
class row2 extends StatelessWidget {
  const row2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(width: 20,),
            Container( child: Text("Trips Near you",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.topStart,height: 40,width: 130,),
            SizedBox(width: 50,),
            Container( child: Text("(15% off)",style:TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold),),alignment: AlignmentDirectional.topStart,height: 20,width:130 ,)],



    );

  }
}
