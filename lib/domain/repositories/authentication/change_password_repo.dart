import 'package:home_care/data/models/request/authentication/change_password_request.dart';

abstract class ChangePasswordRepo {
  Future<bool> changePassword(ChangePasswordRequest request);
}
