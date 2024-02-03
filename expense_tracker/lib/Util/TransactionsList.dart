import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          const Row(
            children: [
              Text(
                "Recent Expenses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 10),
                              color: Colors.grey.withOpacity(0.09),
                              blurRadius: 10.0,
                              spreadRadius: 4.0),
                        ]),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red.withOpacity(0.3)),
                        child: Icon(Icons.paid,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      title: Row(
                        children: [
                          Expanded(child: Text("Car rental")),
                          Text(
                            "£E400",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Balance',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13)),
                                Spacer(),
                                Text(
                                  "£E525",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                )
                              ],
                            ),
                            Text("23rd January 2024 4:50",
                                style: TextStyle(color: Colors.grey))
                          ]),
                    ),
                  ),
                );
              })
        ]));
  }
}
