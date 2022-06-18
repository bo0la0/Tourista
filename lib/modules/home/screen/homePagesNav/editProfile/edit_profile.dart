
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/shared/components/components.dart';
import 'package:tourista/shared/components/rounded_input_field.dart';
import 'package:tourista/shared/cubit/cubit.dart';
import 'package:tourista/shared/cubit/states.dart';


class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();
  var dropdownvalue= 'select language';


  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state){},
      builder: (context, state){
        var userModel = AppCubit.get(context).model;
        var ProfilePic = AppCubit.get(context).profilePic;
        nameController.text = '${userModel?.name}';
        emailController.text = '${userModel?.email}';
        phoneController.text = '${userModel?.phone}';
        var lann = AppCubit.get(context).model!.language;
        if(lann == 'en'){
          lann = 'English';
        }
        else if(lann == 'es'){
          lann = 'española';
        }
        else if(lann == 'it'){
          lann = 'italiana';
        }
        else if(lann == 'fr'){
          lann = 'française';
        }
        else if(lann == 'de'){
          lann = 'deutsch';
        }
        else if(lann == 'ru'){
          lann = 'русский';
        }
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
                        language: dropdownvalue == 'select language' ? lann : dropdownvalue,
                        image:AppCubit.get(context).ProfileUrl
                    )
                    ;}
                    else{
                      AppCubit.get(context).updateUser(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        language: dropdownvalue == 'select language' ? lann : dropdownvalue,
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
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text('Language : ',style: TextStyle(fontSize: 16),),
                    SizedBox(width: 14,),
                    DropDownButton(selectedValue: dropdownvalue, items: ['English','española','italiana','française','deutsch','русский','select language'],onChanged: (value){
                    setState(() {
                      dropdownvalue = value!;
                        });}),
                ],
                )

              ],
            ),
          ),

        );
      },
    );
  }
}
