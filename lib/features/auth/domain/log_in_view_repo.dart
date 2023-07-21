import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class LoginViewRepo {
  Future<UserCredential> userLogin({
    required String email,
    required String password,
    required BuildContext context,
  });

  Future<UserCredential> signInWithGoogle();
}
