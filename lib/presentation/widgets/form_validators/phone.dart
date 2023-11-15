import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/widgets/form_validators/formz.dart';

enum PhoneNumberValidationError { empty, invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([String value = '']) : super.pure(value);
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberValidationError? validator(String? value) {
    if (Utils.isNullOrEmpty(value)) {
      return PhoneNumberValidationError.empty;
    } else if (!ValidateUtils.validatePhone(value!)) {
      return PhoneNumberValidationError.invalid;
    } else {
      return null;
    }
  }

  @override
  String? showError(BuildContext context) {
    final lang = Utils.languageOf(context);

    if (error == PhoneNumberValidationError.empty) {
      return lang.mustNotEmpty(lang.phone_number);
    } else if (error == PhoneNumberValidationError.invalid) {
      return lang.malformedField(lang.phone_number);
    } else {
      return null;
    }
  }
}
