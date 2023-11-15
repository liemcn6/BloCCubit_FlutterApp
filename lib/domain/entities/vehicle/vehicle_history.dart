import 'vehicle_list.dart';

class VehicleHistory {
  final List<VehicleHistoryData> data;

  const VehicleHistory({
    this.data = const [],
  });
}

class VehicleHistoryData {
  final String id;
  final String organizationName;
  final String buildingName;
  final VehicleApprovalStatus approvalStatus;
  final String period;
  final int countBike;
  final int countMotorbike;
  final int countCar;

  VehicleHistoryData(
      {required this.id,
      required this.organizationName,
      required this.buildingName,
      required this.approvalStatus,
      required this.period,
      required this.countBike,
      required this.countMotorbike,
      required this.countCar});
}
