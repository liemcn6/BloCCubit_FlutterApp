part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  final bool validateOldPass;
  final bool validateNewPass;
  final bool validateNewPassAgain;
  final TextEditingController oldPasswordController;
  final TextEditingController passwordController;
  final TextEditingController passwordAgainController;
  final GlobalKey<FormState> formKeyCPW;
  const ChangePasswordState({
    required this.validateNewPass,
    required this.validateNewPassAgain,
    required this.validateOldPass,
    required this.oldPasswordController,
    required this.passwordController,
    required this.passwordAgainController,
    required this.formKeyCPW,
  });

  @override
  List<Object> get props => [
        validateNewPass,
        validateNewPassAgain,
        validateOldPass,
        oldPasswordController,
        passwordController,
        passwordAgainController,
        formKeyCPW,
      ];

  ChangePasswordState copyWith({
    bool? validateOldPass,
    bool? validateNewPass,
    bool? validateNewPassAgain,
    TextEditingController? oldPasswordController,
    TextEditingController? passwordController,
    TextEditingController? passwordAgainController,
    GlobalKey<FormState>? formKeyCPW,
  }) {
    return ChangePasswordState(
      validateOldPass: validateOldPass ?? this.validateOldPass,
      validateNewPass: validateNewPass ?? this.validateNewPass,
      validateNewPassAgain: validateNewPassAgain ?? this.validateNewPassAgain,
      oldPasswordController: oldPasswordController ?? this.oldPasswordController,
      passwordController: passwordController ?? this.passwordController,
      passwordAgainController: passwordAgainController ?? this.passwordAgainController,
      formKeyCPW: formKeyCPW ?? this.formKeyCPW,
    );
  }
}

final class ChangePasswordInitial extends ChangePasswordState {
  ChangePasswordInitial()
      : super(
          passwordController: TextEditingController(),
          oldPasswordController: TextEditingController(),
          passwordAgainController: TextEditingController(),
          validateNewPass: false,
          validateNewPassAgain: false,
          validateOldPass: false,
          formKeyCPW: GlobalKey<FormState>(),
        );
}
