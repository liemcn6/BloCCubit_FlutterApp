mixin ForgotPasswordRepo {
  Future<bool> sendPasswordResetEmail(String email);
}
