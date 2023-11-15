import '../../repositories/authentication/forgot_password_repo.dart';

class ForgotPasswordUseCase {
  final ForgotPasswordRepo _repository;

  ForgotPasswordUseCase(this._repository);

  Future<bool> sendPasswordResetEmail(String email) async {
    return await _repository.sendPasswordResetEmail(email);
  }
}
