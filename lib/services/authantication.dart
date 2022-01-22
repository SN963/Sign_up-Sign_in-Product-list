import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Authantication {
  /*Signup(String email, String Password) {
    Future<void> sign_up(String email, String password) async {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } on PlatformException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    }
  }*/

  late final FirebaseAuth _auth;
  Authantication(this._auth);
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  Future<String?> login({
    String? email,
    String? password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      return "Log in";
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  Future<String?> signUp({String? email, String? password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      return "Sign up";
    } on PlatformException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  Future<void> signOut() async {}
}
