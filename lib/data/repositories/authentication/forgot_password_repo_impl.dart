import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/authentication/forgot_password_init_request.dart';
import 'package:home_care/domain/repositories/authentication/forgot_password_repo.dart';

class ForgotPasswordRepoImpl extends BaseRepository with ForgotPasswordRepo {
  @override
  Future<bool> sendPasswordResetEmail(String email) async {
    final result = await Result.guardAsync(
      () => post(ApiEndpoints.forgotPassword, ForgotPasswordInitRequest(email: email)),
    );

    if (!result.isError) {
      return true;
    }

    return false;
  }
}
