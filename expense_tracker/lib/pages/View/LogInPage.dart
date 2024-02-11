import 'package:expense_tracker/pages/View/SignUpPage.dart';
import 'package:expense_tracker/pages/View/HomescreenView.dart';
import 'package:expense_tracker/pages/authentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  var isloader = false;
  var AuthneticationService = Authentication();

  Future<void> _submitform() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isloader = true;
      });
      if (_formkey.currentState!.validate()) {
        var data = {
          "email": EmailController.text,
          "password": PasswordController.text,
        };
        await AuthneticationService.loguserin(data, context);
        setState(() {
          isloader = false;
        });
      }
    }
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
                  "Log Into Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
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
                              "Log In",
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
                        MaterialPageRoute(builder: (context) => MyForm()));
                  },
                  child: Text("Dont have an account? SignUp",
                      style: TextStyle(color: Colors.green, fontSize: 15)),
                )
              ],
            )),
      ),
    );
  }
}
