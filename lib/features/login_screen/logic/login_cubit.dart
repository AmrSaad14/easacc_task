import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // login by google
  signInWithGoogle() async {
    // Trigger the authentication flow
    emit(LoginLoading());
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential

    final auth = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) {
      debugPrint('Login Success');
      emit(LoginSuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(LoginFailed());
    });

    return auth;
  }

  // login by facebook

  // i can't add facebook because it's required developer account and i don't have it

}
