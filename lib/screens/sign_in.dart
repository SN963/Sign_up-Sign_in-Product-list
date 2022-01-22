import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/home_screen.dart';
import 'package:flutter_application_6/screens/sign_up.dart';
import 'package:flutter_application_6/screens/signin_k.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/Sign-in';
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _form = GlobalKey<FormState>();

  final emailChecker = TextEditingController();

  final passChecker = TextEditingController();

  @override
  void dispose() {
    emailChecker.dispose();
    passChecker.dispose();
    super.dispose();
  }

  void _printemailState() {
    // ignore: avoid_print
    print("First Text : ${emailChecker.text}");
  }

  void _printpassState() {
    // ignore: avoid_print
    print("Second Text : ${passChecker.text}");
  }

  @override
  void initState() {
    super.initState();
    emailChecker.addListener(_printemailState);
    passChecker.addListener(_printpassState);
  }

  bool _obsecure = true;

  @override
  Widget build(BuildContext context) {
    //for taking the screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //Single to avoid the overflow
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //add the image and full the screen width
            Image.asset(
              'assets/signin/Fruits-and-Vegetables.jpg',
              width: size.width,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "Fruits & Vegtables",
                    //primary color that is green found in the main
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //The title that appear before the text area
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 200),
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(0), child: sign_in()),
                //size of the first text (Email)
                //SizedBox(height: size.height * 0.04),*/
                const Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
                    child: sign_in()),

                Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailChecker,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: passChecker,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                                    // Toggle light when tapped.
                                    _obsecure = !_obsecure;
                                  });
                                },
                                child: Icon(
                                  _obsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.green,
                                )),
                          ),
                          obscureText: _obsecure,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //const SignInTextField(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context)
                                      .primaryColor, // background
                                  onPrimary: Colors.white,
                                  // foreground
                                ),
                                onPressed: () {
                                  if (_form.currentState!.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  }
                                },
                                child: const Text(
                                  'LogIn',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //To show the user the input that need to be entered

                //size of the first text (Password)
                //SizedBox(height: size.height * 0.04),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: size.height / 1)),
                    InkWell(
                      onTap: () {},
                      child: const Text("Forget Password?",
                          style: TextStyle(fontSize: 16)),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 20, top: 0)),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
