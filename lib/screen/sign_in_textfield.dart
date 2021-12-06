import 'package:flutter/material.dart';
import 'package:testing_mobile_project/screen/sign_up.dart';
//import 'package:project_application/screen/components/sign_in_button.dart';

//import '../homescreen.dart';
//import '../sign_up.dart';

class SignInTextField extends StatefulWidget {
  const SignInTextField({Key? key}) : super(key: key);

  @override
  State<SignInTextField> createState() => _SignInTextFieldState();
}

class _SignInTextFieldState extends State<SignInTextField> {
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

  bool _obsecure = true;
  @override
  Widget build(BuildContext context) {
    //To take the size of the screen that differ from device to another
    Size size = MediaQuery.of(context).size;
    return Padding(
      key: _form,
      padding: const EdgeInsets.symmetric(),
      child: Column(
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
          TextFormField(
            /*validator: (value) {
              if (value == null || value.isEmpty || value.contains('@')) {
                return 'Please enter some text';
              }
              return null;
            },*/
            //To show the user the input that need to be entered
            decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.green,
                )),
          ),
          //size of the first text (Password)
          SizedBox(height: size.height * 0.04),
          TextFormField(
            /*validator: (value) {
              if (value == null || value.isEmpty || value.contains('@')) {
                return 'Please enter some text';
              }
              return null;
            },*/
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
                    _obsecure ? Icons.visibility : Icons.visibility_off,
                    color: Colors.green,
                  )),
            ),
            //obscure to hide the password entered
            obscureText: _obsecure,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SignInTextField(),
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
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );*/
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
          ),
        ],
      ),
    );
  }
}
