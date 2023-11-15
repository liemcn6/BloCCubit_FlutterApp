import 'package:home_care/presentation/modules/vehicle/enum/vehicle_type.dart';

class VehicleList {
  final List<VehicleListData> data;

  const VehicleList({this.data = const []});
}

class VehicleListData {
  final String id;
  final String licensePlate;
  final VehicleType type;
  final DateTime registrationDate;
  final DateTime startDate;
  final DateTime endDate;
  final VehicleStatus status;
  final double unitPrice;

  VehicleListData(
      {required this.id,
      required this.licensePlate,
      required this.type,
      required this.registrationDate,
      required this.startDate,
      required this.status,
      required this.unitPrice,
      required this.endDate});
}

enum VehicleStatus {
  active("active"),
  pending("pending"),
  inactive("inactive");

  final String value;

  const VehicleStatus(this.value);
}

enum VehicleApprovalStatus {
  approved("APPROVED"),
  waitApprove("WAIT_APPROVE"),
  rejected("REJECTED"),
  neW("NEW"),
  canceled("CANCELED");

  final String value;

  const VehicleApprovalStatus(this.value);
}
