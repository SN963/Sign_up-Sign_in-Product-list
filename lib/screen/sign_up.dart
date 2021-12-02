import 'package:flutter/material.dart';
import 'package:project_application/screen/sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(left: 50, bottom: 100)),
              Text("Sign Up",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor)),
              const Padding(padding: EdgeInsets.only(left: 50, bottom: 30)),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail, color: Colors.green),
                  hintText: 'Please enter your email',
                  labelText: 'Email *',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                  hintText: 'Please enter your password',
                  labelText: 'Password *',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.green),
                  hintText: 'Please-re enter your password',
                  labelText: 'Re-Enter Password *',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.green),
                  hintText: 'Please enter your phone number',
                  labelText: 'Phone *',
                ),
              ),
              /*TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.home, color: Colors.green),
                  hintText: 'Please enter your city name',
                  labelText: 'City *',
                ),
              ),*/
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
                      builder: (_) => const SignIn(),
                    ),
                  );
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
