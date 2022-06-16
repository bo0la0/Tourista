import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:tourista/model/TouristTripModel.dart';
import 'package:tourista/model/Trips.dart';
import 'package:tourista/model/chatScreens/chat.dart';
import 'package:tourista/modules/chatUser/chat_page.dart';
import 'package:tourista/modules/chatUser/messagesss.dart';
import 'package:tourista/modules/home/screen/chatUser/message_chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class newchat extends StatelessWidget {
  const newchat({
    Key? key,
    required this.tripData,
  }) : super(key: key);

  final List<TouristTripModel> tripData;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: kPrimaryColor,
            title: Text(
              "Tourista",
              style: TextStyle(fontSize: 20),
            ),
            elevation: 0.8,
          ),
          body: Container(
            child: ListView.builder(
              itemCount: tripData.length,
              padding: const EdgeInsets.only(top: 8),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    navigateTo(context, ChatPage(TripId: tripData[index].tripId!, userName: AppCubit.get(context).model!.name!, TripName: tripData[index].name!,));
                  },
                  child: Container(
                    child: ListTile(
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                NetworkImage('${tripData[index].tripImage}'),
                          ),
                          // if(tripData.IsActive)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      title: Text(
                        "${tripData[index].tripName}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        dummyData[index].message,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

//
