import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';

mixin VehicleRegistrationRepo {
  Future<String?> registerVehicle(VehicleRegistrationRequest data);
  Future<bool> updateVehicle(String id, VehicleRegistrationRequest data);
  Future<bool> deleteVehicle(String id);
  Future<List<RowItem>> getVehicleTypes(String id);
  Future<bool> requestApproval(String id);
  Future<bool> vehicleTempleSave(VehicleRegistrationRequest body);
  Future<VehicleHistoryDetail> getVehicleHistoryDetail({required String id});
}
