class ServiceHistory {
  final List<ServiceHistoryData> data;

  const ServiceHistory({this.data = const []});
}

class ServiceHistoryData {
  final String id;
  final String facilityName;
  final DateTime registrationDate;
  final ServiceRegistrationStatus status;

  ServiceHistoryData(
      {required this.id,
      required this.facilityName,
      required this.registrationDate,
      required this.status});
}

enum ServiceRegistrationStatus {
  approved("APPROVED"),
  waitApprove("WAIT_APPROVE"),
  rejected("REJECTED"),
  canceled("CANCELED"),
  waitCancel("WAIT_CANCEL");

  final String value;

  const ServiceRegistrationStatus(this.value);
}
