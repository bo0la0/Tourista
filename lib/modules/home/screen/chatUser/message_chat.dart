import 'package:flutter/material.dart';
import 'package:tourista/model/chatScreens/chatMessage.dart';
import 'package:tourista/model/style/TextStyle.dart';
class message extends StatefulWidget {
  const message({Key? key}) : super(key: key);

  @override
  _messageState createState() => _messageState();
}

class _messageState extends State<message> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        backgroundColor:Color(-1088543194),

        title:
        Column(
          children:
          [

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text("Tourista",style: TextStyle(fontSize: 23),),
              Container(
                width:200,
                child: IconButton(
                  icon: Icon(Icons.notifications),
                  iconSize: 30,
                  alignment: Alignment.topRight,
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
            Row(
              children: [
                BackButton(),
                Align(
                  widthFactor: 3,
                  child:Text("Abo Simble",style: s3,),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){},child: Text("Auto Translate",style: TextStyle(color: Colors.green,fontSize: 10),),),
            ),
          ],
        ),),
      body: Column(children: [Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment:
                      messages[index].messageType  == "sender"? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: <Widget>[
                        if (messages[index].messageType  == "receiver")
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            backgroundImage: AssetImage(messages[index].avtarUrl),
                          ),
                        Material(
                          borderRadius: messages[index].messageType  == "receiver"
                              ? BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0))
                              : BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          elevation: 5.0,
                          color: messages[index].messageType  == "receiver" ? Color(-1088543194) : Colors.blueAccent,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              messages[index].messageContent,
                              style: TextStyle(
                                color: messages[index].messageType  == "receiver" ? Colors.white : Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
            ),
           ],),
      ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(offset: Offset(0,2),blurRadius: 32,color: Colors.black12),],
              color: Colors.transparent),
          child: Row(

            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20.0),),
                      child: Row(
                        children: [
                          Icon(Icons.sentiment_satisfied,color: Colors.grey,size: 25,),
                          SizedBox(width: 3,),
                          Expanded(
                              child: TextField(
                                decoration:InputDecoration(hintText:"type message",border: InputBorder.none) ,)),
                          Icon(Icons.attach_file,color: Colors.grey,size: 25,),
                          SizedBox(width: 5,),
                          Icon(Icons.camera_alt_outlined,color: Colors.grey,size: 25,),
                          SizedBox(width: 5,),],),),
                  )),
              Container(
                height: 100,
                width: 50,
                child: FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.send,color: Colors.white,size: 18,),
                  elevation: 2,
                ),
              ),
              SizedBox(width: 4,),

            ],),),
      ],),


    );
  }
}
