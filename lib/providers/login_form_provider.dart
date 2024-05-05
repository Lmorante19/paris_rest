import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  bool isValidForm() {
    print(email);
    print(password);
    print(formKey.currentState?.validate());
    return formKey.currentState?.validate() ?? false;
  }
}
