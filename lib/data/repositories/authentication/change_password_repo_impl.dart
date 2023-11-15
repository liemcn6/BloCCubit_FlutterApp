import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/authentication/change_password_request.dart';
import 'package:home_care/domain/repositories/authentication/change_password_repo.dart';

class ChangePasswordRepoImpl extends BaseRepository implements ChangePasswordRepo {
  @override
  Future<bool> changePassword(ChangePasswordRequest request) async {
    bool isDone = false;
    final result = await Result.guardAsync(() => post(ApiEndpoints.changePassword, request));
    result.ifSuccess((data) {
      isDone = true;
    });
    return isDone;
  }
}
