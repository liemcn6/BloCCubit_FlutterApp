import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_history_detail_repo.dart';

class VehicleHistoryDetailUseCase {
  final VehicleHistoryDetailRepo _repository;

  VehicleHistoryDetailUseCase(this._repository);

  Future<VehicleHistoryDetail> getVehicleHistoryDetail(
      {required String id}) async {
    return await _repository.getVehicleHistoryDetail(id: id);
  }
}
