import 'package:flutter/material.dart';

class Imaga extends StatelessWidget {
  const Imaga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("OverFlow Error"),
          ),
          body: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Image.asset("assets/sign-up-back.jpg"),
                ),
              ])),
    );
  }
}
