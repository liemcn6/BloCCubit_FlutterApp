import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/models/request/authentication/change_password_request.dart';
import 'package:home_care/domain/usecases/authentication/change_password_usecase.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  final _usecase = getIt.get<ChangePasswordUsecase>();

  setValidateOldPass(bool validateOldPass) {
    emit(state.copyWith(validateOldPass: validateOldPass));
  }

  setValidateNewPass(bool validateNewPass) {
    emit(state.copyWith(validateNewPass: validateNewPass));
  }

  setValidateNewPassAgain(bool validateNewPasAgain) {
    emit(state.copyWith(validateNewPassAgain: validateNewPasAgain));
  }

  void submit(GlobalKey<FormState> formKey) {
    // validate all the form fields
    if (formKey.currentState!.validate()) {
      // on success, notify the parent widget
    }
  }

  Future<void> changePassword(BuildContext? context, AppColors appColors, String newPass,
      String oldPass, AppLocalizations lang) async {
    Utils.showLoading();
    final tokenData = await AppSecureStorage.getToken();
    final refreshToken = tokenData?.refreshToken;

    ChangePasswordRequest params = ChangePasswordRequest(
      oldPassword: state.oldPasswordController.text,
      newPassword: state.passwordController.text,
      refreshToken: refreshToken,
    );

    final res = await _usecase.changePassword(params);
    if (res == true) {
      showDialog(
        context: context!,
        builder: (BuildContext contextDialog) => DialogCustom(
          title: lang.notify,
          content: lang.changePassSuccessMes,
          textBtnAccept: lang.close,
          showBtnCancel: false,
          onPressBtnAccept: () {
            Navigator.of(contextDialog).pop();
          },
          onPressBtnCancel: () {},
        ),
      );
    } else {
      WidgetUtils.showError(context: context!, errorText: lang.something_went_wrong);
    }
    Utils.hideLoading();
  }
}
