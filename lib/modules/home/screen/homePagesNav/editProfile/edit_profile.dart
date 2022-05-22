
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';


class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = AppCubit.get(context).model;
        var ProfilePic = AppCubit.get(context).profilePic;
        nameController.text = '${userModel?.name}';
        emailController.text = '${userModel?.email}';
        phoneController.text = '${userModel?.phone}';

        return Scaffold(
          appBar: AppBar(
            title: Text('edit profile'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if(AppCubit.get(context).ProfileUrl != null ){
                    AppCubit.get(context).updateUser(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        image:AppCubit.get(context).ProfileUrl
                    )
                    ;}
                    else{
                      AppCubit.get(context).updateUser(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                      );
                    }

                  },
                  focusNode: FocusScopeNode(),
                  child: Text('update'),
                ),
              ),
            ],
          ),
          body:SingleChildScrollView(
            child: Column(
              children: [
                if(state is ImageUpdateLoadingState)
                  LinearProgressIndicator(),
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
                              backgroundImage: ProfilePic == null ? NetworkImage(
                                  '${userModel?.image}'
                              ) : FileImage(ProfilePic) as ImageProvider ,
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                AppCubit.get(context).getImage();
                              },
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
                RoundedInputField(
                  hintText: 'email',
                  controller: emailController ,
                  text: 'name must not be empty',
                  icon: Icons.email,
                ),
                RoundedInputField(
                  hintText: 'phone',
                  controller: phoneController ,
                  text: 'phone must not be empty',
                  icon: Icons.phone,
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}
