import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:tourista/modules/home/screen/homePagesNav/Homenavigation_par.dart';
class detailscreen {
  late final int id;
  late final String title, text, image, price;

  detailscreen(
      {required this.id, required this.text, required this.title, required this.image, required this.price});
}
List<detailscreen>DetailsData=[



];
class details_screen extends StatelessWidget {
  const details_screen(int index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading:IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){Navigator.pop(context,
       );} ,),
        backgroundColor: Color(-1088543194),toolbarHeight: 100,
        title: Text("Details"),

      ),
      body: ListView(
        children: [

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsetsDirectional.all(20),
                    child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(20),
                        child: Image.asset('assets/images/sharm-el-sheikh-old-market-sinai-egypt-B6MADK.jpg',fit: BoxFit.fitWidth,))),

              ),


            ],
          ),

            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container (

            child: Text("pyramids")),
            ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 320,
                    height: 120,
                    color: Colors.grey[100],
                    child: Text('The Big Tasty, not to be confused with the Big N Tasty, is a burger available in parts of Europe, '
                        'South America and the Middle East. It is made of a sesame seed bun,'
                        ' iceberg lettuce, tomatoes, Big Tasty sauce, cheese, bacon, and a beef patty or chicken patty.'),

                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Trip include",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.circle,size: 10,),
              Text(". Riding Horse",
                style: TextStyle(
                    fontSize: 13.0
                ),
              ),
            ],),
          ),

          SizedBox(height: 5,),    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.circle,size: 10,),
              Text(". Riding Horse",
                style: TextStyle(
                    fontSize: 13.0
                ),
              ),
            ],),
          ),

          SizedBox(height: 5,),    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.circle,size: 10,),
              Text(". Riding Horse",
                style: TextStyle(
                    fontSize: 13.0
                ),
              ),
            ],),
          ),

          SizedBox(height: 5,),    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.circle,size: 10,),
              Text(". Riding Horse",
                style: TextStyle(
                    fontSize: 13.0
                ),
              ),
            ],),
          ),

          SizedBox(height: 5,),



          //SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child:  Container(
                height: 100,
                child: Row(

                  children: [
                    Spacer(flex: 5,),
                    Container(
                        width: 230,
                        child: Text("500\$",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),)),
                    Container(
                      height: 50,
                      alignment: AlignmentDirectional.bottomEnd,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                        elevation: 5.0,
                        child: Text("Book now ",style: TextStyle(color: Colors.white,fontSize: 15),),
                        color: Color(-1088543194),
                        onPressed: () {

                        },
                      ),
                    )
                  ],),
              )
          ),
        ],

      ),

    );
  }
}
