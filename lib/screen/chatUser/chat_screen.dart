import 'package:flutter/material.dart';
import 'package:tourista/model/chatScreens/chat.dart';
import 'message_chat.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key}) : super(key: key);
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _firstController =
  ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
           leading:IconButton(
             icon: const Icon(Icons.arrow_back_ios),
             onPressed: (){Navigator.pop(context);} ,),
         toolbarHeight: 120,

          backgroundColor:Color(-1088543194),
          title: Text("Tourista",style: TextStyle(fontSize: 20),),
          elevation: 0.8,
          actions: [
            Container(
              child: IconButton(
                icon: Icon(Icons.search),
                iconSize: 30,
                alignment: Alignment.centerRight,
                onPressed: () {
                },
              ),

            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.notifications),
                iconSize: 30,
                alignment: Alignment.centerLeft,
                onPressed: () {

                },),),]),
      body:  Scrollbar(
        isAlwaysShown: true,
        thickness: 2,
        controller: _firstController,
        child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>message()));
                },
                child: Column(
                  children: [
                    Divider(height: 10),
                    ListTile(
                      leading: Stack(
                  children: [
                      CircleAvatar(
                      backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(dummyData[index].avtarUrl),
                          ),
                         if(dummyData[index].IsActive)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle,border: Border.all(color:Colors.white,width: 3,),
                            )),
                          ),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dummyData[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dummyData[index].time,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        child: Text(
                          dummyData[index].message,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );

            }),
      ),
    );
  }
}
