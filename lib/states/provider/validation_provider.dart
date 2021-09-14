import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ValidationProvider extends ChangeNotifier {
  late String _errorName;
  late String _errorEmail;
  late String _errorPassword;
  late String _errorPasswordConfirmation;
  late String _errorPhoneNumber;
  late String _errorAddress;
  late String _errorVerificationCode;
  bool _isAcceptTerm = false;

  String get errorName => _errorName;
  String get errorEmail => _errorEmail;
  String get errorPassword => _errorPassword;
  String get errorPasswordConfirmation => _errorPasswordConfirmation;
  String get errorPhoneNumber => _errorPhoneNumber;
  String get errorAddress => _errorAddress;
  String get errorVerificationCode => _errorVerificationCode;
  bool get isAcceptTerm => _isAcceptTerm;

  void changeName(String value) {
    if (value.length == 0) {
      _errorName = "Name Must Be Filled";
    } else {
      _errorName = "";
    }
  }

  void changeEmail(String value) {
    if (value.length == 0) {
      _errorEmail = "Email Must Be Filled";
    } else if (EmailValidator.validate(value) == false) {
      _errorEmail = "Email Must Be Valid";
    } else {
      _errorEmail = "";
    }
  }

  void changePassword(String value) {
    if (value.length == 0) {
      _errorPassword = "Password Must Be Filled";
    } else if (value.length < 6) {
      _errorPassword = "Password Can't Less Than 6 Characters";
    } else {
      _errorPassword = "";
    }
  }

  void changePasswordConfirmation(String value, String password) {
    if (value.length == 0) {
      _errorPasswordConfirmation = "Password Confirm Must Be Filled";
    } else if (value != password) {
      _errorPasswordConfirmation = "Password Confirm Is Not Match";
    } else {
      _errorPasswordConfirmation = "";
    }
  }

  void changePhoneNumber(String value) {
    if (value.length == 0) {
      _errorPhoneNumber = "Number Must Be Filled";
    } else if (value.length < 9) {
      _errorPhoneNumber = "Number Can't Less Than 9 Characters";
    } else {
      _errorPhoneNumber = "";
    }
  }

  void changeAddress(String value) {
    if (value.length == 0) {
      _errorAddress = "Address Must Be Filled";
    } else if (value.length < 9) {
      _errorAddress = "Address Can't Less Than 9 Characters";
    } else {
      _errorAddress = "";
    }
  }

  void changeVerificationCode(String value) {
    if (value.length == 0) {
      _errorVerificationCode = "Code Must Be Filled";
    } else if (value.length != 4) {
      _errorVerificationCode = "Code Must Have 4 Characters";
    } else {
      _errorVerificationCode = "";
    }
  }

  void changeTerm(bool value) {
    _isAcceptTerm = !_isAcceptTerm;

    notifyListeners();
  }

  bool isAllValidate() {
    if (_errorName == "" &&
        _errorEmail == "" &&
        _errorPassword == "" &&
        _errorPasswordConfirmation == "") {
      return true;
    } else {
      return false;
    }
  }

  bool isNumberAddressValidate() {
    if (_errorPhoneNumber == "" &&
        _errorAddress == "" &&
        _isAcceptTerm == true) {
      return true;
    } else {
      return false;
    }
  }

  void resetChange() {
    _errorName = '';
    _errorEmail = '';
    _errorPassword = '';
    _errorPasswordConfirmation = '';
    notifyListeners();
  }

  void resetChangeNumberAddress() {
    _errorPhoneNumber = '';
    _errorAddress = '';
    _isAcceptTerm = false;

    notifyListeners();
  }

  void resetVerificationCode() {
    _errorVerificationCode = '';

    notifyListeners();
  }
}
