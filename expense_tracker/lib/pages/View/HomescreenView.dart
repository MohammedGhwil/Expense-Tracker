import 'package:expense_tracker/pages/Controller/HomescreenController.dart';
import 'package:flutter/material.dart';

class HomescreenView extends StatelessWidget {
  const HomescreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              HomescreenController().signout();
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: Center(child: Text("LOGGED IN")),
    );
  }
}
