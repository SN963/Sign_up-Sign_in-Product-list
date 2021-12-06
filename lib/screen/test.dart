import 'package:flutter/material.dart';
import 'package:testing_mobile_project/screen/homescreen.dart';
import 'package:testing_mobile_project/screen/sign_up.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final _form = GlobalKey<FormState>();
  final _emailChecker = TextEditingController();
  final _passChecker = TextEditingController();

  @override
  void dispose() {
    _emailChecker.dispose();
    _passChecker.dispose();
    super.dispose();
  }

  void _printemailState() {
    // ignore: avoid_print
    print("First Text : ${_emailChecker.text}");
  }

  void _printpassState() {
    // ignore: avoid_print
    print("Second Text : ${_passChecker.text}");
  }

  @override
  void initState() {
    super.initState();
    _emailChecker.addListener(_printemailState);
    _passChecker.addListener(_printpassState);
  }

  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //The title that appear before the text area
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                //size of the first text (Email)
                SizedBox(height: size.height * 0.04),
                Form(
                  key: _form,
                  child: (Column(
                    children: [
                      TextFormField(
                        validator: (email) {
                          if (email == null ||
                              email.isEmpty ||
                              email.contains('@')) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        //To show the user the input that need to be entered
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                          ),
                        ),
                      ),

                      //size of the first text (Password)
                      SizedBox(height: size.height * 0.04),
                      TextFormField(
                        validator: (pass) {
                          if (pass == null || pass.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          //To show the user the input that need to be entered
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle eye when tapped.
                                obsecure = !obsecure;
                              });
                            },
                            child: Icon(
                              obsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        obscureText: obsecure,
                      ),
                    ],
                  )),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //const SignInTextField(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor, // background
                          onPrimary: Colors.white,
                          // foreground
                        ),
                        onPressed: () {
                          if (_form.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'LogIn',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 40.0)),
                          InkWell(
                            onTap: () {},
                            child: const Text("Forget Password?",
                                style: TextStyle(fontSize: 16)),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(left: 20, top: 0)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
