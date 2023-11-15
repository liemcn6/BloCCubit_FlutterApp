part of '../core.dart';

class RegexUtils {
  static bool isEmail(String email) {
    RegExp regExp = RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*');
    return regExp.hasMatch(email);
  }

  static bool isPhoneNumber(String phoneNo) {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?0[0-9]{9}$)');
    return regExp.hasMatch(phoneNo);
  }
}
