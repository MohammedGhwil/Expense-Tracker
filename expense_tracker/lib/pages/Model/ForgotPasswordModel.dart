import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordModel {
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e;
    }
  }
}
