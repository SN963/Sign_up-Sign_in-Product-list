import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/sign_in.dart';

class splash extends StatefulWidget {
  //static const routeName = '/splash';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[500],
      child: Center(
        child: Text(
          "Fruits & Vegtables ",
          style: new TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
