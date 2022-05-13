import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/model/registerModel.dart';
import 'package:tourista/modules/splash/signup/cubit/state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(Empty());

  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
  required String email,
  required String password,
  required String name,
  required String phone,
}){
    emit(UserRegisterLoading());
// try {
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value) {
    // print(value.user?.email);
    // print(value.user?.uid);
    userCreate(
        name: name,
        email: email,
        phone: phone,
        uId: value.user?.uid);
  })
      .catchError((error) {
    emit(UserRegisterError(error.toString()));
  });
/*} on FirebaseAuthException catch (e){
  if (e.code == 'weak-password'){
    print('weak password');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}*/

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

  IconData suffix = Icons.visibility;
  bool isPass = true;
  void passwordVisibility(){
    isPass = !isPass;
    suffix = isPass ? Icons.visibility : Icons.visibility_off;

    emit(ChangePasswordVisibilityState());
  }

}
