import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/pages/Controller/HomescreenController.dart';
import 'package:expense_tracker/pages/Dashboard.dart';
import 'package:expense_tracker/pages/Wallet.dart';
import 'package:flutter/material.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({Key? key}) : super(key: key);

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  int myindex = 0;
  List<Widget> widgetlist = [const Dashboard(), const MyWallet()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetlist,
        index: myindex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          currentIndex: myindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet')
          ]),
      appBar: AppBar(
        elevation: 0,
        title: Text("Welcome"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              HomescreenController().signout();
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}
