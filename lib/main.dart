import 'package:flutter/material.dart';

//import 'package:project_application/screen/homescreen.dart';
import 'package:project_application/screen/sign_in.dart';
//import 'package:project_application/screen/sign_up.dart';

//import 'package:project_application/screen/components/sign_in_button.dart';
//import 'package:project_application/screen/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organic Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[500],
        focusColor: Colors.blue[300],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignIn(),
      //home: HomeScreen(),
    );
  }
}
