import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/authentication/register_request.dart';
import 'package:home_care/domain/repositories/authentication/register_repo.dart';

class RegisterRepoImpl extends BaseRepository with RegisterRepo {
  @override
  Future<bool> register(RegisterRequest body) async {
    bool isSuccess = false;
    final result = await Result.guardAsync(() => post(ApiEndpoints.register, body));

    result.ifSuccess((data) {
      isSuccess = true;
    });

    return isSuccess;
  }
}
