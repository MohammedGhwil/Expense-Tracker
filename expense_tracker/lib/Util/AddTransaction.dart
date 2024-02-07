import 'package:expense_tracker/Util/TransactionCategories.dart';
import 'package:expense_tracker/Util/Validate.dart';
import 'package:flutter/material.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  var type = "Expense";
  var isloader = false;
  var appvalidation = AppValidation();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Future<void> _submitform() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isloader = true;
      });
      if (_formkey.currentState!.validate()) {
        // var data = {
        //   "email": EmailController.text,
        //   "password": PasswordController.text,
        // };
        // await AuthneticationService.loguserin(data, context);
        setState(() {
          isloader = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                validator: appvalidation.isEmptyCheck,
                decoration: InputDecoration(labelText: "Description"),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appvalidation.isEmptyCheck,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Amount"),
            ),
            DropdownButtonFormField(
                value: 'Expense',
                items: [
                  DropdownMenuItem(child: Text("Expense"), value: "Expense"),
                  DropdownMenuItem(child: Text("Income"), value: "Income"),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      type = value;
                    });
                  }
                }),
            TransactionCategory(),
            ElevatedButton(
              onPressed: () {
                if (isloader == false) {
                  _submitform();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: isloader
                  ? Center(child: CircularProgressIndicator())
                  : Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
