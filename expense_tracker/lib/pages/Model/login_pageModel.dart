import 'package:firebase_auth/firebase_auth.dart';

class LoginModel {
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}
