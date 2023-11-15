import 'package:home_care/data/models/request/authentication/login_request.dart';
import 'package:home_care/domain/entities/authentication/authorities.dart';
import 'package:home_care/domain/entities/authentication/login.dart';

abstract class LoginRepo {
  Future<Login> requestLogin(LoginRequest request);
  Future<Authorities?> requestAuthorities();
  Future<Login> requestRefreshToken();
}
