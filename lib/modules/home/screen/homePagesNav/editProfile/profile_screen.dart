import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/home/screen/homePagesNav/editProfile/edit_profile.dart';
import 'package:tourista/shared/components/constants.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';



class ProfileScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

     return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel = AppCubit.get(context).model;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            toolbarHeight: 20,

          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Container(
                            height: 140.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  4.0,
                                ),
                                topRight: Radius.circular(
                                  4.0,
                                ),
                              ),
                              // image: DecorationImage(
                              //   image: NetworkImage(
                              //     '${userModel.cover}',
                              //   ),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        CircleAvatar(
                          radius: 64.0,
                          backgroundColor:
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundImage: NetworkImage(
                              '${userModel?.image}'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${userModel?.name}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),

                  Text(
                    '${userModel?.email}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Balance is : ${userModel?.balance}\$',
                    style: Theme
                        .of(context)
                        .textTheme
                        .caption,
                  ),

                  // Align(
                  //   child: Text(
                  //     'Balance is : ${userModel?.balance}\$',
                  //     style: Theme
                  //         .of(context)
                  //         .textTheme
                  //         .caption,
                  //   ),
                  //   alignment: AlignmentDirectional.topCenter,
                  //
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  EditProfile()),
                        );
                        },
                      child: Text(
                        'edit profile info',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        AppCubit.get(context).addBalance();
                      },
                      child: Text('make a deposit'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {

                      },
                      child: Text('make a withdraw'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    },

    );
  }

  }
