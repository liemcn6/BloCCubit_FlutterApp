import '../../entities/vehicle/vehicle_history.dart';
import '../../entities/vehicle/vehicle_list.dart';

mixin VehicleListRepo {
  Future<VehicleList> getVehicleList();
  Future<VehicleHistory> getVehicleHistory();
}
