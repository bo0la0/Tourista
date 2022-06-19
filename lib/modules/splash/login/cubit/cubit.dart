
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tourista/modules/splash/login/cubit/state.dart';
import 'package:tourista/shared/components/components.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(Empty());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> userLogin({
    required String email,
    required String password,

})async{
    try {
      emit(UserLoginLoading());

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim(),
      ).then((value) {
        emit(UserLoginSuccess(value.user!.uid));
      });
    }on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
        ShowToast(text: 'No user found for that email.');
        emit(UserLoginError(e.toString()));
      } else if (e.code == 'wrong-password') {
        ShowToast(text: 'Wrong password provided for that user.');
        emit(UserLoginError(e.toString()));
      }

    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      emit(UserLoginLoading());
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
      emit(UserLoginSuccess('${_auth.currentUser?.uid}'));

    } on FirebaseAuthException catch (e) {
      emit(UserLoginError(e.toString()));
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
    emit(UserSignOutGoogle());
  }


}




