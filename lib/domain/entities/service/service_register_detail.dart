import 'package:home_care/domain/entities/service/service_history_detail.dart';

class ServiceRegisterDetail {
  final String? id;
  final String? issuedUserId;
  final String? status;
  final int? startTime;
  final int? endTime;
  final String? registrationDate;
  final ServiceRegisterDetail? latestVersion;
  final String? buildingName;
  final String? facilityGroupName;
  final String? unitName;
  final String? facilityName;
  final double? totalAmount;
  final List<ServiceHistoryDetail>? histories;

  const ServiceRegisterDetail({
    this.id,
    this.issuedUserId,
    this.status,
    this.latestVersion,
    this.startTime,
    this.endTime,
    this.registrationDate,
    this.buildingName,
    this.facilityGroupName,
    this.unitName,
    this.facilityName,
    this.totalAmount,
    this.histories,
  });
}
