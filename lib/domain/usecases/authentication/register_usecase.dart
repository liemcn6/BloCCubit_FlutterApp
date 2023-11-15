import 'package:home_care/data/models/request/authentication/register_request.dart';
import 'package:home_care/data/repositories/authentication/register_repo_impl.dart';
import 'package:home_care/domain/repositories/authentication/register_repo.dart';

class RegisterUseCase {
  final RegisterRepo _repository = RegisterRepoImpl();

  Future<bool> register(RegisterRequest body) async {
    return await _repository.register(body);
  }
}
