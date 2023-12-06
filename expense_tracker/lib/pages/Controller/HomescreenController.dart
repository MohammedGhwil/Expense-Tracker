import 'package:firebase_auth/firebase_auth.dart';

class HomescreenController {
  void signout() {
    FirebaseAuth.instance.signOut();
  }
}
