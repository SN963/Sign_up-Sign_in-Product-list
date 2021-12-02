import 'package:flutter/material.dart';
import 'package:project_application/screen/homescreen.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor, // background
                onPrimary: Colors.white,
                // foreground
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('LogIn'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text("Forget Password?",
                      style: TextStyle(fontSize: 16)),
                ),
                const Padding(padding: EdgeInsets.only(left: 30, top: 0)),
                InkWell(
                  onTap: () {
                    /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );*/
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
