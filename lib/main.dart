import 'package:flutter/material.dart';
import 'package:testing_mobile_project/screen/add_product.dart';
import 'package:testing_mobile_project/screen/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vegetables & Fruits Bascket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[500],
        focusColor: Colors.blue[300],
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Test(),
    );
  }
}
