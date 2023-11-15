class UpdateTicketRequest {
  String? id;
  bool? isCustomerTicket; //true||null: customer, false : employee, default: true
  String? buildingId;
  String? content;
  String? floorId;
  List<String>? illustrationsFiles;
  String? note;
  String? status;
  List<String>? floorIds;

  UpdateTicketRequest({
    this.id,
    this.isCustomerTicket,
    this.buildingId,
    this.content,
    this.floorId,
    this.illustrationsFiles,
    this.note,
    this.status,
    this.floorIds,
  });

  factory UpdateTicketRequest.fromJson(Map<String, dynamic> json) => UpdateTicketRequest(
        id: json['id'] as String?,
        isCustomerTicket: json['isCustomerTicket'] as bool?,
        buildingId: json['buildingId'] as String?,
        content: json['content'] as String?,
        floorId: json['floorId'] as String?,
        illustrationsFiles: json['illustrationsFiles'] as List<String>?,
        note: json['note'] as String?,
        status: json['status'] as String?,
        floorIds: json['floorIds'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'isCustomerTicket': isCustomerTicket,
        'buildingId': buildingId,
        'content': content,
        'floorId': floorId,
        'illustrationsFiles': illustrationsFiles,
        'note': note,
        'status': status,
        'floorIds': floorIds,
      };
}
