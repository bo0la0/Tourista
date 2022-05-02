import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/registerModel.dart';
import 'package:tourista/modules/splash/signup/cubit/state.dart';
import 'package:tourista/shared/components/constants.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(Empty());

  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
  required String email,
  required String password,
}){
    emit(UserRegisterLoading());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
          name: null,
          email: email,
          phone: null,
          uId: value.user?.uid);

    })
        .catchError((error){
          emit(UserRegisterError(error.toString()));
    });

  }

  void userCreate({
  required name,
  required email,
  required phone,
  required uId,
})
  {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );
    FirebaseFirestore.instance
        .collection('accounts')
        .doc(uId)
        .set(model.toMap())
        .then((value){
          emit(CreateUserSuccess());
    })
        .catchError((error){
          emit(CreateUserError(error.toString()));
    });
  }
// bool? isCorrect ;
//   void checkPassword({
//   required String password1,
//   required String password2,
// }){
//     if (password1 != password2){
//       isCorrect = false;
//     }else {
//       isCorrect = true;
//     }
//     emit(ValidatePasswordState());
//   }
  IconData suffix = Icons.visibility;
  bool isPass = true;
  void passwordVisibility(){
    isPass = !isPass;
    suffix = isPass ? Icons.visibility : Icons.visibility_off;

    emit(ChangePasswordVisibilityState());
  }

}
