import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class FirebaseAuthServices extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  //--------create account with email and password----------//
  Future<User?> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      sendemailverification();
      return credential.user;
    } catch (e) {
      print("error occur");
    }
    return null;
  }

// ---- sign in with email and password----------//
  Future<User?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("error occur");
    }
    return null;
  }

  //-----email verification-------//
  Future<void> sendemailverification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TlsException(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TlsException();
      throw ex.message;
    }
  }
}
