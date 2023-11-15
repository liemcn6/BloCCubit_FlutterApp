import 'package:home_care/domain/entities/vehicle/vehicle_detail.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_detail_repo.dart';

class VehicleDetailUseCase {
  final VehicleDetailRepo _repository;

  VehicleDetailUseCase(this._repository);

  Future<VehicleDetail> getVehicleDetail({required String id}) async {
    return await _repository.getVehicleDetail(id: id);
  }

  Future<bool> postCancelVehicle({required String id}) async {
    return await _repository.postCancelVehicle(id: id);
  }
}
