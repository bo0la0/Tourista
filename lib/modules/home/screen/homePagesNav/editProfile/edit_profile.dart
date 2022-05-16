import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';


class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = AppCubit.get(context).model;
        return Scaffold(
          appBar: AppBar(
            title: Text('edit profile'),
            actions: [
              ElevatedButton(
                onPressed: () {  },
                child:
                Text('update'),
              ),
              SizedBox(width: 10,),
            ],
          ),
          body:SingleChildScrollView(
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
                          ),
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
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
                          IconButton(
                              onPressed: (){},
                              icon: CircleAvatar(
                                radius: 15,
                                  child: Icon(Icons.camera_alt_outlined))),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                RoundedInputField(
                  hintText: 'Name',
                  controller: nameController ,
                  text: 'name must not be empty',
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}
