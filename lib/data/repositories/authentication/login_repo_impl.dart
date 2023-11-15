import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/authentication/login_request.dart';
import 'package:home_care/data/models/response/authentication/authorities_data_response.dart';
import 'package:home_care/data/models/response/authentication/login_data_response.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/entities/authentication/authorities.dart';
import 'package:home_care/domain/entities/authentication/login.dart';
import 'package:home_care/domain/entities/authentication/permissions.dart';
import 'package:home_care/domain/repositories/authentication/login_repo.dart';

class LoginRepoImpl extends BaseRepository implements LoginRepo {
  @override
  Future<Login> requestLogin(LoginRequest request) async {
    Login login = const Login(data: null);
    final res = await Result.guardAsync(() => post(ApiEndpoints.login, request));

    res.ifSuccess((data) {
      final loginResponse = BaseResponse.fromJson(data?.data);

      if (loginResponse.data == null) {
        return;
      }

      login = Login(data: LoginDataResponse.fromJson(loginResponse.data!));
    });

    res.ifError((error, errorData) {
      if (errorData != null) {
        final captchaData = errorData['captcha'] as String?;
        final transactionId = errorData['transactionId'] as String?;

        login = Login(
          data: null,
          captchaData: captchaData,
          transactionId: transactionId,
        );
      }
    });

    return login;
  }

  @override
  Future<Authorities?> requestAuthorities() async {
    final res = await Result.guardAsync(() => get(ApiEndpoints.authorities));

    if (res.isSuccess) {
      final data = res.data;
      final authoritiesResponse = BaseResponse.fromJson(data?.data);
      if (authoritiesResponse.data == null) {
        return null;
      }

      final authorities = AuthoritiesDataResponse.fromJson(authoritiesResponse.data);
      final perms =
          Permissions.fromListAuthorities(authorities.grantedPermissions, authorities.isRoot);

      return Authorities(
        permissions: Utils.isNullOrEmpty(authorities.grantedPermissions) ? null : perms,
        accountType: authorities.accountType,
        userLevel: authorities.userLevel,
        isAdmin: authorities.isRoot,
      );
    }

    return null;
  }

  @override
  Future<Login> requestRefreshToken() async {
    final tokenData = await AppSecureStorage.getToken();
    final result = await Result.guardAsync(
      () => post(ApiEndpoints.refreshToken, {'refreshToken': tokenData?.refreshToken}),
    );

    if (result.isSuccess) {
      final data = result.data;

      if (data == null || data.data == null) {
        return const Login(data: null);
      }

      final loginResponse = BaseResponse.fromJson(data.data);

      if (loginResponse.data == null) {
        return const Login(data: null);
      }

      final login = Login(data: LoginDataResponse.fromJson(loginResponse.data!));
      await AppSecureStorage.setToken(login.data);

      return login;
    }

    return const Login(data: null);
  }
}
