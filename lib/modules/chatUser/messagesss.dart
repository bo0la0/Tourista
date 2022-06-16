import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/TouristTripModel.dart';

import 'package:tourista/model/message_model.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';

class MessagesScreen extends StatefulWidget {
  final TouristTripModel userDataModel;

  const MessagesScreen({
    Key? key,
    required this.userDataModel,
  }) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();

    AppCubit.get(context).getMessages(widget.userDataModel);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.userDataModel.name!,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (AppCubit.get(context).messagesList.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (AppCubit.get(context).messagesList[index].senderId == AppCubit.get(context).user!.touristuId) {
                          return MyItem(
                            model: AppCubit.get(context).messagesList[index],
                          );
                        }

                        return UserItem(
                          model: AppCubit.get(context).messagesList[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10,),
                      itemCount: AppCubit.get(context).messagesList.length,
                    ),
                  ),
                if (AppCubit.get(context).messagesList.isEmpty)
                  const Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                SizedBox(height: 20,),

                TextFormField(
                  controller: AppCubit.get(context).messageController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'type message',
                    border: const OutlineInputBorder(),
                    suffixIcon: MaterialButton(
                      minWidth: 1,
                      onPressed: () {
                        AppCubit.get(context).sendMessage(widget.userDataModel, tripId: widget.userDataModel.tripId!);
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyItem extends StatelessWidget {
  final MessageDataModel model;

  const MyItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  15.0,
                ),
                topEnd: Radius.circular(
                  15.0,
                ),
                bottomStart: Radius.circular(
                  15.0,
                ),
              ),
              color: Colors.teal,
            ),
            child: Text(
              model.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  final MessageDataModel model;

  const UserItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  15.0,
                ),
                topEnd: Radius.circular(
                  15.0,
                ),
                bottomEnd: Radius.circular(
                  15.0,
                ),
              ),
              color: Colors.grey[200],
            ),
            child: Text(
              model.message,
              style: const TextStyle(),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
