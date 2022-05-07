
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/modules/splash/login/cubit/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(Empty());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,

}){
    emit(UserLoginLoading());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      emit(UserLoginSuccess());
    }).catchError((erorr){
      emit(UserLoginError(erorr));
    });

  }

}
