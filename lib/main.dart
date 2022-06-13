import 'package:desafio/view/home.dart';
import 'package:desafio/view/reset_password.dart';
import 'package:desafio/view/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/login.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Soft',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginAuth(),
        '/passwordRecovery': (context) => const ResetPassword(),
        '/home': (context) => const Home(),
        //'/login': (context) => const LoginAuth(),
        //'/signup': (context) => const Signup(),
      },
    );
  }
}
