import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../screens/signin_k.dart';
import './Provider/products_provider.dart';
import './screens/home_screen.dart';
import 'package:provider/provider.dart';
import './Provider/cart.dart';
import 'Provider/auth.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(),
          update: (context, authValue, prevproducts) => prevproducts!
            ..getData(
              authValue.token!,
              authValue.userId!,
              prevproducts.items,
            ),
        ),
        ChangeNotifierProvider.value(value: Cart()),
        //ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: Products()),
      ],
      child: Consumer<Auth>(
        builder: (cxt, auth, _) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.green[500],
            focusColor: Colors.blue[300],
            scaffoldBackgroundColor: Colors.white,
          ),
          home: auth.isSign
              ? const HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (cxt, AsyncSnapshot authsnapshot) =>
                      authsnapshot.connectionState == ConnectionState.waiting
                          ? splash()
                          : const sign_in()),
        ),
      ),
    );
  }
}
