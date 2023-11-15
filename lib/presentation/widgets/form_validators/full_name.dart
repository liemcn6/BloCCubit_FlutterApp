import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/form_validators/formz.dart';

enum FullNameValidationError { empty, invalid }

class FullName extends FormzInput<String, FullNameValidationError> {
  const FullName.pure([String value = '']) : super.pure(value);
  const FullName.dirty([String value = '']) : super.dirty(value);

  @override
  FullNameValidationError? validator(String value) {
    if (Utils.isNullOrEmpty(value)) {
      return FullNameValidationError.empty;
    } else if (value.length < 3) {
      return FullNameValidationError.invalid;
    } else {
      return null;
    }
  }

  @override
  String? showError(BuildContext context) {
    final lang = Utils.languageOf(context);

    if (error == FullNameValidationError.empty) {
      return lang.mustNotEmpty(lang.nameAndFamilyName);
    } else if (error == FullNameValidationError.invalid) {
      return lang.invalidField(lang.nameAndFamilyName);
    } else {
      return null;
    }
  }
}
