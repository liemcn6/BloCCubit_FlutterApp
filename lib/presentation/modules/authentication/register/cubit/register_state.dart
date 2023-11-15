part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool checkBox;

  const RegisterState({
    this.checkBox = false,
  });

  @override
  List<Object> get props => [
        checkBox,
      ];

  RegisterState copyWith({
    bool? checkBox,
  }) {
    return RegisterState(
      checkBox: checkBox ?? this.checkBox,
    );
  }
}

final class RegisterInitial extends RegisterState {}
