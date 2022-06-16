import 'package:flutter/material.dart';
import 'package:tourista/model/TouristTripModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/chatUser/group_chat_room.dart';
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
                    // navigateTo(context, ChatRoom(chatRoomId: tripData[index].tripId!, TripName: tripData[index].name!,));
                    navigateTo(context, GroupChatRoom(groupName: tripData[index].tripName!, groupChatId: tripData[index].tripId!,));
                    // navigateTo(context, ChatPage(TripId: tripData[index].tripId!, userName: AppCubit.get(context).model!.name!, TripName: tripData[index].name!,));
                  },
                  child: Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage:
                        NetworkImage('${tripData[index].tripImage}'),
                      ),
                      title: Text(
                        "${tripData[index].tripName}",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
