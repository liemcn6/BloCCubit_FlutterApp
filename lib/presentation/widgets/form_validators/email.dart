import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/form_validators/formz.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([String value = '']) : super.pure(value);
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else if (!ValidateUtils.validateEmail(value)) {
      return EmailValidationError.invalid;
    } else {
      return null;
    }
  }

  @override
  String? showError(BuildContext context) {
    final lang = Utils.languageOf(context);

    if (error == EmailValidationError.empty) {
      return lang.mustNotEmpty(lang.email);
    } else if (error == EmailValidationError.invalid) {
      return lang.malformedField(lang.email);
    } else {
      return null;
    }
  }
}
