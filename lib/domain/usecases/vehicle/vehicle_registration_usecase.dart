import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/data/repositories/vehicle/vehicle_registration_repo_impl.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_registration_repo.dart';

class VehicleRegistrationUseCase {
  final VehicleRegistrationRepo _vehicleRegistrationRepo = VehicleRegistrationRepoImpl();

  Future<bool> vehicleRegistration(VehicleRegistrationRequest body) async {
    final vehicleRegistrationId = await _vehicleRegistrationRepo.registerVehicle(body);

    if (vehicleRegistrationId != null) {
      return await _vehicleRegistrationRepo.requestApproval(vehicleRegistrationId);
    }

    return false;
  }

  Future<List<RowItem>> getVehicleTypes(String buildingId) async {
    return _vehicleRegistrationRepo.getVehicleTypes(buildingId);
  }

  Future<bool> vehicleTempleSave(VehicleRegistrationRequest body) async {
    return await _vehicleRegistrationRepo.vehicleTempleSave(body);
  }

  Future<VehicleHistoryDetail> getVehicleHistoryDetail({required String id}) async {
    return await _vehicleRegistrationRepo.getVehicleHistoryDetail(id: id);
  }

  Future<bool> updateVehicle({required String id,required VehicleRegistrationRequest data}) async {
    return await _vehicleRegistrationRepo.updateVehicle(id,data);
  }
}
