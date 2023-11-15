import 'package:home_care/domain/entities/vehicle/vehicle_history.dart';

import '../../entities/vehicle/vehicle_list.dart';
import '../../repositories/vehicle/vehicle_list_repo.dart';

class VehicleListUseCase {
  final VehicleListRepo _repository;

  VehicleListUseCase(this._repository);

  Future<VehicleList> getVehicleList() async {
    return await _repository.getVehicleList();
  }

  Future<VehicleHistory> getVehicleHistory() async {
    return await _repository.getVehicleHistory();
  }
}
