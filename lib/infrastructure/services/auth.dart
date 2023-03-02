import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/view/auth/sign_in/sign_in_view.dart';

class AuthServices {
  Future<UserCredential> createAccount(
      {required String email, required String password}) async {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> logInAccount(
      {required String email, required String password}) async {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future resetPassword(String email) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future signOut(BuildContext context) async {
    return await FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignInView()));
    });
  }
}
