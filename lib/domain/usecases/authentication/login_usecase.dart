import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/data/models/request/authentication/login_request.dart';
import 'package:home_care/domain/entities/authentication/authorities.dart';
import 'package:home_care/domain/entities/authentication/login.dart';
import 'package:home_care/domain/repositories/authentication/login_repo.dart';
import 'package:home_care/presentation/routes.dart';

class LoginUseCase {
  final LoginRepo _repo;

  LoginUseCase(this._repo);

  Future<Login?> requestLogin(String username, String password) async {
    final res = await _repo.requestLogin(LoginRequest(username: username, password: password));

    return _handleAfterGotToken(res);
  }

  Future<Login?> requestRefreshToken() async {
    final res = await _repo.requestRefreshToken();

    return _handleAfterGotToken(res);
  }

  Future<Login?> _handleAfterGotToken(Login? login) async {
    if (login?.data != null) {
      await AppSecureStorage.setToken(login?.data);
      final authorities = await _repo.requestAuthorities();

      if (authorities == null) {
        return null;
      }

      if (authorities.accountType != AccountType.customer && authorities.isAdmin != true) {
        final context = AppNavigator.navigatorKey.currentContext;

        if (context != null && context.mounted == true) {
          final tr = Utils.languageOf(context);
          WidgetUtils.showError(
              context: context,
              errorText: tr.wrong_account_type,
              errorTitle: tr.limited_access,
              onTap: () async {
                await AppSecureStorage.clearToken();
              });
        }

        return null;
      }

      AppStorage().setAuthorities(authorities);
      return login;
    }

    return null;
  }
}
