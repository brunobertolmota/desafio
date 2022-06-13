import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum AuthStatus {
  successful,
  emailAlreadyExists,
  invalidEmail,
  wrongPassword,
  error,
  unknown
}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.wrongPassword:
        errorMessage = "E-mail ou senha errados.";
        break;
      default:
        errorMessage = "Ocorreu um erro não identificado.";
    }
    return errorMessage;
  }
}

class AuthService {
  final _auth = FirebaseAuth.instance;
  AuthStatus status = AuthStatus.unknown;

  Future<AuthStatus> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleAuthException(e);
    }
    return status;
  }

  Future<AuthStatus> resetPassword(String email) async {
    await _auth
        .sendPasswordResetEmail(email: email)
        .then((value) => status = AuthStatus.successful)
        .catchError(
            (e) => status = AuthExceptionHandler.handleAuthException(e));
    return status;
  }
}
