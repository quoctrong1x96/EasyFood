import 'package:cenafood/resources/AuthMethod.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginPageBloc with ChangeNotifier {
  AuthMethods mAuthMethods = AuthMethods();
  bool isLoginPressed = false;

  String? validateAccount(String accountName) {
    if (accountName.isEmpty) {
      return "Tài khoản không được để trống";
    }
    return null;
  }

  String? validatePassword(String password) {
    if ((password.isNotEmpty && password.length < 6) ||
        (password.isNotEmpty && password.length > 18)) {
      return 'Mật khẩu tối thiểu 6 ký tự và tối đa 18 ký tự';
    } else if (password.isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  Future<void> Login(String userName, String password) async {
    isLoginPressed = true;
    notifyListeners();
    await mAuthMethods.handleSignInEmail(userName, password);
    isLoginPressed = false;
    notifyListeners();
  }
}
