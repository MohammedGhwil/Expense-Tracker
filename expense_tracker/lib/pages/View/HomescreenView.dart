import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Util/AddTransaction.dart';
import 'package:expense_tracker/pages/Dashboard.dart';
import 'package:expense_tracker/pages/LogInPage.dart';
import 'package:expense_tracker/pages/Wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomescreenView extends StatefulWidget {
  const HomescreenView({Key? key}) : super(key: key);

  @override
  State<HomescreenView> createState() => _HomescreenViewState();
}

class _HomescreenViewState extends State<HomescreenView> {
  var islogoutloading = false;

  loguserout() async {
    setState(() {
      islogoutloading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: AddTransactions(),
          );
        });
  }

  int myindex = 0;
  List<Widget> widgetlist = [Dashboard(), const MyWallet()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _dialogBuilder(context);
        }),
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
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
              loguserout();
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}
