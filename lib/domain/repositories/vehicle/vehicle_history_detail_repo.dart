import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';

mixin VehicleHistoryDetailRepo {
  Future<VehicleHistoryDetail> getVehicleHistoryDetail({required String id});
}
