import 'package:home_care/domain/entities/vehicle/vehicle_detail.dart';

mixin VehicleDetailRepo {
  Future<VehicleDetail> getVehicleDetail({required String id});

  Future<bool> postCancelVehicle({required String id});
}
