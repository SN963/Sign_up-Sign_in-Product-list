import 'package:flutter/material.dart';
import 'package:project_application/screen/components/sign_in_button.dart';
//import 'package:project_application/screen/components/sign_in_button.dart';
//import 'package:project_application/screen/test.dart';
import 'package:project_application/screen/components/sign_in_textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //double heigh=size.height*0.35;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/Fruits-and-Vegetables.jpg',
              width: size.width,
            ),
            Center(
              child: Column(
                children: [
                  Text("Fruits & Vegtables",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SignInTextField(),
            const SignInButton()
          ],
        ),
      ),
    );
  }
}
