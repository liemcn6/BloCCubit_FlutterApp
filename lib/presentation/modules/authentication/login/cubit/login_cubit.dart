import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/domain/entities/authentication/login.dart';
import 'package:home_care/domain/usecases/authentication/login_usecase.dart';
import 'package:home_care/domain/usecases/building/building_usecase.dart';
import 'package:home_care/domain/usecases/notification/notification_useccase.dart';
import 'package:home_care/domain/usecases/profile/profile_usecase.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:local_auth/local_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late final usernameController = TextEditingController(text: state.username);
  late final passwordController = TextEditingController(text: state.password);
  final loginUseCase = getIt.get<LoginUseCase>();
  final profileUseCase = getIt.get<ProfileUseCase>();
  final notiUseCase = getIt.get<NotificationUseCase>();
  final buildingUsecase = getIt.get<BuildingUseCase>();

  LoginCubit() : super(LoginInitial());

  void preCheckLogin() async {
    Utils.showLoading();
    final userProfile = await AppSecureStorage.getProfile();
    final isLocalAuthEnabled = await AppSecureStorage.getBiometricAuthenticate();

    // final isAutoLogin = await handleAutoLogin();

    Utils.hideLoading();

    // if (isAutoLogin) {
    //   return;
    // }

    if (userProfile != null) {
      usernameController.text = userProfile.username ?? '';
      emit(state.copyWith(
        username: userProfile.username,
        avatar: userProfile.avatarFileUrl,
        fullName: userProfile.fullName,
        mode: LoginMode.half,
        isLocalAuthEnabled: isLocalAuthEnabled,
      ));
    } else {
      emit(state.copyWith(
        username: '',
        avatar: '',
        fullName: '',
        mode: LoginMode.full,
        isLocalAuthEnabled: isLocalAuthEnabled,
      ));
    }
  }

  void usernameChanged(String value) {
    emit(state.copyWith(username: value));
    checkLogin();
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
    checkLogin();
  }

  void checkLogin() {
    emit(state.copyWith(
      isUsernameValid: RegExp(AppRegex.username).hasMatch(state.username),
      isPasswordValid: RegExp(AppRegex.password).hasMatch(state.password),
    ));
  }

  Future<void> onTapLogin(dynamic data, context, theme, lang) async {
    Utils.showLoading();
    final loginData = await loginUseCase.requestLogin(state.username, state.password);
    final localAuthEnabledFor = await AppSecureStorage.getLocalAuthEnabledFor();

    if (loginData != null) {
      if (loginData.captchaData != null) {
      } else {
        if (!Utils.isNullOrEmpty(localAuthEnabledFor) && state.username != localAuthEnabledFor) {
          await AppSecureStorage.setLocalAuthEnabledFor('');
          await AppSecureStorage.setBiometricAuthenticate(false);
        }
        await _handleAfterAuth(loginData);
        AppNavigator.pushRoot(Routes.bottomNavigationBar, 0);
        WidgetUtils.showSnackBar(context: context, theme: theme, title: lang.login_success);
      }
    }

    Utils.hideLoading();
  }

  void changeToFullLoginMode() {
    emit(state.copyWith(mode: LoginMode.full));
  }

  Future onRefreshToken({bool isShowLoading = true}) async {
    if (isShowLoading) Utils.showLoading();
    final loginData = await loginUseCase.requestRefreshToken();
    if (loginData != null) {
      await _handleAfterAuth(loginData);
      AppNavigator.pushRoot(Routes.bottomNavigationBar, 0);
    }
    Utils.hideLoading();
  }

  Future toggleBiometric() async {
    final LocalAuthentication auth = LocalAuthentication();
    final authenticated = await auth.authenticate(
      localizedReason: 'authenticate to access',
      options: const AuthenticationOptions(
        stickyAuth: true,
        sensitiveTransaction: true,
        biometricOnly: true,
      ),
    );

    if (!authenticated) {
      return;
    }

    await onRefreshToken();
  }

  Future<bool> handleAutoLogin({bool isShowLoading = true}) async {
    if (isShowLoading) Utils.showLoading();
    final tokenData = await AppSecureStorage.getToken();
    final isLocalAuthEnabled = await AppSecureStorage.getBiometricAuthenticate();
    emit(state.copyWith(isExistedToken: !Utils.isNullOrEmpty(tokenData?.refreshToken)));

    if (isLocalAuthEnabled) {
      Utils.hideLoading();
      return false;
    }

    if (!Utils.isNullOrEmpty(tokenData?.refreshToken)) {
      await onRefreshToken(isShowLoading: isShowLoading);
      return true;
    }

    return false;
  }

  Future<void> _handleAfterAuth(Login loginData) async {
    await profileUseCase.requestProfile();
    final token = await AppSecureStorage.getFCMToken();
    await notiUseCase.requestRegisterTokenFireBase(token);
    final encToken = await Utils.getEncryptToken();
    await notiUseCase.requestCountUnread();
    final buildingList = await buildingUsecase.getUserBuildingList();

    AppStorage().setImgEncToken(encToken);
    AppStorage().setBuildingList(buildingList);
  }
}
