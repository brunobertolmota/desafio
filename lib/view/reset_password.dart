import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/auth_firebase.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: ListView(children: [
            const SizedBox(height: 25),
            SvgPicture.asset('assets/images/login_logo.svg'),
            const SizedBox(height: 25),
            Text(
              'ESQUECEU A SENHA',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(112, 82, 204, 1),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Text(
              'Informe seu e-mail para recuperar sua senha',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: InkWell(
                onTap: () async {
                  final status = await authService
                      .resetPassword(emailController.text.trim());
                  if (status == AuthStatus.successful) {
                    Fluttertoast.showToast(
                        msg: 'E-mail de recuperação de senha enviado');
                    Navigator.pushNamed(context, '/login');
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
                      'Enviar',
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
            )
          ]),
        ),
      ),
    );
  }
}
