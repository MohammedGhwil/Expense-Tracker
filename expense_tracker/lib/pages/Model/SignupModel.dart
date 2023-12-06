import 'package:firebase_auth/firebase_auth.dart';

class SignupModel {
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}
