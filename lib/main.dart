import 'package:desafio/view/home.dart';
import 'package:desafio/view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => const MyHomePage(title: 'Marvel Personagens'),
        //'/login': (context) => const LoginAuth(),
        //'/signup': (context) => const Signup(),
      },
    );
  }
}
