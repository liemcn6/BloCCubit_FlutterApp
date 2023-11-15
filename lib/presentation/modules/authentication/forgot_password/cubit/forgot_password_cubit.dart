import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/authentication/forgot_password_usecase.dart';
import 'package:home_care/presentation/widgets/dialog_custom.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final usecase = getIt.get<ForgotPasswordUseCase>();

  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void submit() {
    if (formKey.currentState?.validate() == true) {}
  }

  void validateEmail(String value) {
    final emailRegex = RegExp(AppRegex.email);
    final isValid = emailRegex.hasMatch(value);

    emit(state.copyWith(isValidEmail: isValid));
  }

  void requestForgotPassword(BuildContext context) async {
    final lang = Utils.languageOf(context);
    final isSuccess = await usecase.sendPasswordResetEmail(emailController.text);

    if (isSuccess) {
      showDialog(
        context: context,
        builder: (BuildContext contextDialog) => DialogCustom(
          title: lang.notify,
          content: lang.mess_notification_request_mail,
          textBtnAccept: lang.close,
          showBtnCancel: false,
          showIconClose: false,
          onPressBtnAccept: () {
            Navigator.of(contextDialog).pop();
          },
          onPressBtnCancel: () {},
        ),
      );
    }
  }
}
