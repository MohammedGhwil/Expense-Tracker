import 'package:expense_tracker/pages/LogInPage.dart';
import 'package:expense_tracker/pages/View/HomescreenView.dart';
import 'package:expense_tracker/pages/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final UserNameController = TextEditingController();

  final EmailController = TextEditingController();

  final PhoneController = TextEditingController();

  final PasswordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var authService = Authentication();
  var isloader = false;

  Future<void> _submitform() async {
    setState(() {
      isloader = true;
    });
    if (_formkey.currentState!.validate()) {
      var data = {
        "username": UserNameController.text,
        "email": EmailController.text,
        "password": PasswordController.text,
        "phone": PhoneController.text,
        "remaining amount": 0,
        "Credit": 0,
        "Debit": 0,
      };
      await authService.createAccount(data, context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomescreenView()));
      setState(() {
        isloader = false;
      });
      //ScaffoldMessenger.of(_formkey.currentContext!)
      //  .showSnackBar(const SnackBar(content: Text("Form Submitted")));
    }
  }

  String? _validateNumber(value) {
    if (value!.isEmpty) {
      return "enter a phone number";
    }
    if (value.length != 10) {
      return "enter a ten digit number";
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value!.isEmpty) {
      return "enter a Password";
    }
    return null;
  }

  String? _validateUsername(value) {
    if (value!.isEmpty) {
      return "enter a username";
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return "Please enter an Email";
    }
    RegExp emailRegExp = RegExp(r'[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Please Enter a valid email";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252634),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Create an account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: UserNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: Color(0xAA494A59),
                      filled: true,
                      labelText: "Username",
                      labelStyle: TextStyle(color: Color(0xFF949494)),
                      suffixIcon: Icon(Icons.person, color: Color(0xFF949494)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateUsername,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: EmailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: Color(0xAA494A59),
                      filled: true,
                      suffixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF949494),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xFF949494)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateEmail,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: PhoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: Color(0xAA494A59),
                      filled: true,
                      suffixIcon: Icon(Icons.phone, color: Color(0xFF949494)),
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Color(0xFF949494)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validateNumber,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: PasswordController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: Color(0xAA494A59),
                      filled: true,
                      suffixIcon: Icon(Icons.lock, color: Color(0xFF949494)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Color(0xFF949494)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  validator: _validatePassword,
                ),
                SizedBox(height: 16),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: isloader
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              "Sign Up",
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        isloader ? print("Hold On") : _submitform();
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text("Already have an account? Log In",
                      style: TextStyle(color: Colors.green, fontSize: 15)),
                )
              ],
            )),
      ),
    );
  }
}
