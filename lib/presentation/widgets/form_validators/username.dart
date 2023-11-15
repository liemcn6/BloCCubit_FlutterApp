import 'package:flutter/material.dart';
import 'package:home_care/presentation/widgets/form_validators/formz.dart';

enum UserNameValidationError { empty, invalid }

class UserName extends FormzInput<String, UserNameValidationError> {
  const UserName.pure([String value = '']) : super.pure(value);
  const UserName.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UserNameValidationError.empty;
    } else {
      return null;
    }
  }

  static String? showNameErrorMessage(UserNameValidationError? error) {
    if (error == UserNameValidationError.empty) {
      return 'Empty name';
    } else if (error == UserNameValidationError.invalid) {
      return 'Too short name';
    } else {
      return null;
    }
  }

  @override
  String? showError(BuildContext context) {
    return null;
  }
}
