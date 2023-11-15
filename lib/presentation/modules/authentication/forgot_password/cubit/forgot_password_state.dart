part of 'forgot_password_cubit.dart';

@immutable
class ForgotPasswordState extends Equatable {
  final bool isValidEmail;

  const ForgotPasswordState({
    this.isValidEmail = false,
  });

  @override
  List<Object> get props => [
        isValidEmail,
      ];

  ForgotPasswordState copyWith({bool? isValidEmail}) => ForgotPasswordState(
        isValidEmail: isValidEmail ?? this.isValidEmail,
      );
}

final class ForgotPasswordInitial extends ForgotPasswordState {}
