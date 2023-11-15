import 'package:home_care/data/models/request/authentication/change_password_request.dart';
import 'package:home_care/data/repositories/authentication/change_password_repo_impl.dart';

class ChangePasswordUsecase {
  final ChangePasswordRepoImpl _usecase;
  ChangePasswordUsecase(this._usecase);

  Future<bool> changePassword(ChangePasswordRequest request) async {
    final res = await _usecase.changePassword(request);
    return res;
  }
}
