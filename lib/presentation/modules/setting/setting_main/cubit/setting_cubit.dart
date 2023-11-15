import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/request/authentication/sign_out_request.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';
import 'package:home_care/domain/usecases/profile/profile_usecase.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';
import 'package:local_auth/local_auth.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingInitial());

  //use case
  final profileUseCase = getIt.get<ProfileUseCase>();

  Future<void> getInit({required BuildContext context}) async {
    final userProfile = await AppSecureStorage.getProfile();
    final biometricAuthenticate = await AppSecureStorage.getBiometricAuthenticate();
    final canAuthenticateWithBiometrics = await LocalAuthentication().canCheckBiometrics;

    emit(
      state.copyWith(
        userProfile: userProfile,
        biometricAuthenticate: biometricAuthenticate,
        canUseBiometric: canAuthenticateWithBiometrics,
      ),
    );
  }

  Future<void> handleSignOut(context, AppLocalizations lang, AppTheme theme) async {
    //device token firebase
    final fcmToken = await FirebaseMessaging.instance.getToken();
    //device id
    final deviceId = await DeviceUtils.getDeviceId();
    //refresh token
    final tokenData = await AppSecureStorage.getToken();
    final refreshToken = state.biometricAuthenticate ? "" : tokenData?.refreshToken;

    SignOutRequest params = SignOutRequest(
      deviceId: deviceId ?? "",
      deviceToken: fcmToken ?? "",
      refreshToken: refreshToken ?? "",
    );
    //show dialog to confirm
    if (!context.mounted) return;
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) => DialogCustom(
            colorTitle: theme.colors.red,
            colorButtonAccept: theme.colors.primary,
            textBtnAccept: lang.confirm,
            showBtnCancel: true,
            textBtnCancel: lang.cancel,
            title: lang.notify,
            content: lang.confirmSignOut,
            onPressBtnAccept: () async {
              Utils.showLoading();
              final isDone = await profileUseCase.requestSignOut(params);

              if (isDone) {
                if (!state.biometricAuthenticate) {
                  await AppSecureStorage.clearToken();
                }
                await FirebaseMessaging.instance.deleteToken();
                AppNavigator.pushRoot(Routes.login);
                WidgetUtils.showSnackBar(
                    context: context, theme: theme, title: lang.logout_success);
              } else {
                if (!context.mounted) return;
                WidgetUtils.showError(context: context, errorText: lang.something_went_wrong);
              }
              Utils.hideLoading();
            },
            onPressBtnCancel: () => {Navigator.of(dialogContext).pop()}));
  }

  void handleRemoveAccount(context, AppTheme theme, AppLocalizations lang) async {
    showDialog(
        context: context,
        builder: (BuildContext contextDialog) => DialogCustom(
            colorTitle: theme.colors.titleDialog,
            colorButtonAccept: theme.colors.buttonHazardous,
            textBtnAccept: lang.deleteAccount,
            showBtnCancel: true,
            textBtnCancel: lang.cancel,
            title: lang.notify,
            content: lang.deleteAccountMessage,
            onPressBtnAccept: () async {
              final isDone = await profileUseCase.deleteAccount();
              if (isDone) {
                AppNavigator.pushRoot(Routes.login);
              } else {
                WidgetUtils.showError(context: context, errorText: lang.something_went_wrong);
              }
            },
            onPressBtnCancel: () => {
                  Navigator.of(contextDialog).pop(),
                }));
  }

  //feature login with biometric, not done yet
  void toggleAuthentication(AppLocalizations lang) async {
    final auth = LocalAuthentication();
    final profile = await AppSecureStorage.getProfile();
    final isEnable = state.biometricAuthenticate;

    try {
      await auth.authenticate(
        localizedReason: Platform.isIOS ? lang.use_face_id : lang.use_fingerprint,
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: !isEnable,
        ),
      );
      await AppSecureStorage.setBiometricAuthenticate(!state.biometricAuthenticate);
      await AppSecureStorage.setLocalAuthEnabledFor(profile?.phoneNumber ?? "");
      emit(state.copyWith(biometricAuthenticate: !state.biometricAuthenticate));
    } on PlatformException catch (e) {
      debugPrint("biometric: $e");
    }
  }
}
