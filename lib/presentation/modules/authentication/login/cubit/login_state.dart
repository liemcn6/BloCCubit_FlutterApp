part of 'login_cubit.dart';

enum LoginMode { full, half }

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final String? avatar;
  final String? fullName;
  final LoginMode mode;
  final bool isLocalAuthEnabled;
  final String? captchaImage;
  final bool isExistedToken;

  const LoginState({
    this.username = '',
    this.password = '',
    this.isUsernameValid = false,
    this.isPasswordValid = false,
    this.avatar,
    this.fullName,
    this.mode = LoginMode.full,
    this.isLocalAuthEnabled = false,
    this.captchaImage,
    this.isExistedToken = false,
  });

  @override
  List<Object> get props => [
        username,
        password,
        isUsernameValid,
        isPasswordValid,
        avatar ?? '',
        fullName ?? '',
        mode,
        isLocalAuthEnabled,
        captchaImage ?? '',
        isExistedToken,
      ];

  LoginState copyWith({
    String? username,
    String? password,
    bool? isUsernameValid,
    bool? isPasswordValid,
    String? avatar,
    String? fullName,
    LoginMode? mode,
    bool? isLocalAuthEnabled,
    String? captchaImage,
    bool? isExistedToken,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      avatar: avatar ?? this.avatar,
      fullName: fullName ?? this.fullName,
      mode: mode ?? this.mode,
      isLocalAuthEnabled: isLocalAuthEnabled ?? this.isLocalAuthEnabled,
      captchaImage: captchaImage ?? this.captchaImage,
      isExistedToken: isExistedToken ?? this.isExistedToken,
    );
  }
}

final class LoginInitial extends LoginState {}
