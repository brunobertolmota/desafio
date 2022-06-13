import 'package:desafio/service/auth_firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginAuth extends StatefulWidget {
  const LoginAuth({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginAuthState createState() => _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  var myIcon = SvgPicture.asset('assets/images/password_icon.svg');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isHiddenPasword = true;

  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Center(
        child: ListView(
          children: [
            const SizedBox(height: 25),
            SvgPicture.asset('assets/images/login_logo.svg'),
            const SizedBox(height: 25),
            Text(
              'LOGIN',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(112, 82, 204, 1),
                ),
              ),
            ),
            const SizedBox(height: 30),
            //password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
            ),
            const SizedBox(height: 25),
            //senha field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextField(
                  obscureText: isHiddenPasword,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      hintText: 'Senha',
                      suffixIcon:
                          InkWell(onTap: _togglePasswordView, child: myIcon)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            // --- esqueceu a senha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                child: const Text(
                  'Esqueceu a senha?',
                  //tentando botar o texto na esquerda
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Color.fromRGBO(112, 82, 204, 1)),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/passwordRecovery');
                },
              ),
            ),
            const SizedBox(height: 20),
            // --- botao entrar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: InkWell(
                onTap: () async {
                  final status = await authService.login(
                      emailController.text.trim(), passwordController.text);
                  if (status == AuthStatus.successful) {
                    Fluttertoast.showToast(msg: 'Logado com sucesso!');
                    Navigator.pushNamed(context, '/home');
                  } else {
                    final error =
                        AuthExceptionHandler.generateErrorMessage(status);
                    Fluttertoast.showToast(msg: error);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(112, 82, 204, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Entrar',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPasword = !isHiddenPasword;
    });
  }
}
