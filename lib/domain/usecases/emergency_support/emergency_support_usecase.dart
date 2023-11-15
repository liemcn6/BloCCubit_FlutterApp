import 'package:home_care/domain/entities/emergency_support/hotline.dart';
import 'package:home_care/domain/repositories/emergency_support/emergency_support_repo.dart';

class EmergencySupportUseCase {
  final EmergencySupportRepo _repo;

  EmergencySupportUseCase(this._repo);

  Future<List<Hotline>> getHotlines() async {
    return await _repo.getHotlines();
  }
}
