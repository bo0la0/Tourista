
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/splash/signup/cubit/state.dart';

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
      emit(UserRegisterSuccess());
    })
        .catchError((error){
          emit(UserRegisterError());
    });

  }

}
