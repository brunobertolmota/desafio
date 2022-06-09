import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.popAndPushNamed(context, '/home'));
    var assetsImage = SvgPicture.asset(
        'assets/images/splash.svg'); //<- Creates an object that fetches an image.

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.purple),
          child: Center(
            child: assetsImage,
          ),
        ),
      ),
    );
  }
}
