import 'package:flutter/material.dart';
import 'package:home_care/presentation/widgets/form_validators/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (value.length < 3) {
      return PasswordValidationError.invalid;
    } else {
      return null;
    }
  }

  static String? showPasswordErrorMessage(PasswordValidationError? error) {
    if (error == PasswordValidationError.empty) {
      return 'Empty password';
    } else if (error == PasswordValidationError.invalid) {
      return 'Invalid password';
    } else {
      return null;
    }
  }

  @override
  String? showError(BuildContext context) {
    return null;
  }
}
