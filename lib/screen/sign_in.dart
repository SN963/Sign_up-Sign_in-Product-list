import 'package:flutter/material.dart';
import 'package:testing_mobile_project/screen/sign_in_button.dart';
import 'package:testing_mobile_project/screen/sign_in_textfield.dart';

//import 'package:project_application/screen/components/sign_in_button.dart';
//import 'package:project_application/screen/test.dart';
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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
