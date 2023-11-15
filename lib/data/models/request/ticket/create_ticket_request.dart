class CreateTicketRequest {
  String? id;
  bool? isCustomerTicket; //true||null: customer, false : employee
  String? buildingId;
  String? buildingName;
  String? content;
  String? floorId;
  String? floorName;
  List<String>? illustrationsFiles;
  String? note;
  String? status;
  String? statusName;
  String? issuedUserId;
  String? requesterName;
  String? organizationId;
  String? organizationName;
  String? serviceType;
  String? serviceName;
  String? complaintId;
  String? assigneeUserId;
  int? expectedFinishAt;
  String? priorityLevelId;
  int? expectedReceiveAt;
  List<String> floorIds = [];

  CreateTicketRequest({
    this.id,
    this.isCustomerTicket,
    this.buildingId,
    this.buildingName,
    this.content,
    this.floorId,
    this.floorName,
    this.illustrationsFiles,
    this.note,
    this.status,
    this.statusName,
    this.issuedUserId,
    this.requesterName,
    this.organizationId,
    this.organizationName,
    this.serviceType,
    this.serviceName,
    this.complaintId,
    this.assigneeUserId,
    this.expectedFinishAt,
    this.priorityLevelId,
    this.expectedReceiveAt,
    this.floorIds = const [],
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'isCustomerTicket': isCustomerTicket,
        'buildingId': buildingId,
        'buildingName': buildingName,
        'content': content,
        'floorId': floorId,
        'floorName': floorName,
        'illustrationsFiles': illustrationsFiles,
        'note': note,
        'status': status,
        'statusName': statusName,
        'issuedUserId': issuedUserId,
        'requesterName': requesterName,
        'organizationId': organizationId,
        'organizationName': organizationName,
        'serviceType': serviceType,
        'serviceName': serviceName,
        'complaintId': complaintId,
        'assigneeUserId': assigneeUserId,
        'expectedFinishAt': expectedFinishAt,
        'priorityLevelId': priorityLevelId,
        'expectedReceiveAt': expectedReceiveAt,
        'floorIds': floorIds,
      };
}
