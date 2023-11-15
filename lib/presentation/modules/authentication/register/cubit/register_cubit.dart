import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/authentication/register_request.dart';
import 'package:home_care/domain/usecases/authentication/register_usecase.dart';
import 'package:home_care/presentation/routes.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final fullNameCtrl = TextEditingController();
  final phoneNumCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final retypePasswordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final useCase = getIt.get<RegisterUseCase>();

  RegisterCubit() : super(RegisterInitial());

  void setFullName(String value) {
    validate();
  }

  void setPhoneNumber(String value) {
    validate();
  }

  void setEmail(String value) {
    validate();
  }

  void setUsername(String value) {
    validate();
  }

  void setPassword(String value) {
    validate();
  }

  void setConfirmPassword(String value) {
    validate();
  }

  void setStateCheckbox(bool value) {
    emit(state.copyWith(checkBox: value));
  }

  bool validate() {
    return false;
  }

  void handleRegister() {
    if (formKey.currentState!.validate()) {
      requestRegister();
    }
  }

  Future requestRegister() async {
    Utils.dismissKeyboard();
    Utils.showLoading();

    final registerBody = RegisterRequest(
      fullName: fullNameCtrl.text,
      password: passwordCtrl.text,
      username: usernameCtrl.text,
      email: emailCtrl.text.isEmpty ? null : emailCtrl.text,
      gender: 'OTHER',
      phoneNumber: phoneNumCtrl.text == '' ? null : phoneNumCtrl.text,
    );

    final isSuccess = await useCase.register(registerBody);

    Utils.hideLoading();

    if (isSuccess) {
      AppNavigator.pushRoot(Routes.registerSuccess);
    }
  }
}
