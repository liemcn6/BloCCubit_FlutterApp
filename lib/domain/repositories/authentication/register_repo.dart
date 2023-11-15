import 'package:home_care/data/models/request/authentication/register_request.dart';

mixin RegisterRepo {
  Future<bool> register(RegisterRequest body);
}
