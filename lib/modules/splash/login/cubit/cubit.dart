
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      emit(UserLoginSuccess(value.user!.uid));
    }).catchError((erorr){
      print('$erorr');
      emit(UserLoginError(erorr));
    });

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




