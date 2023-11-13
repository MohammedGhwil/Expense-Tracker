import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signout, icon: Icon(Icons.logout_rounded))
      ]),
      body: Center(child: Text("LOGGED IN")),
    );
  }
}
