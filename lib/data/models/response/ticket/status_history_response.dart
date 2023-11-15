class StatusHistoryResponse {
  String? complaintId;
  String? complaintType;
  String? createdBy;
  int? createdAt;
  String? lastModifiedBy;
  int? lastModifiedAt;
  String? id;
  String? status;
  String? ticketId;
  bool? deleted;

  StatusHistoryResponse({
    this.complaintId,
    this.complaintType,
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.status,
    this.ticketId,
    this.deleted,
  });

  factory StatusHistoryResponse.fromJson(Map<String, dynamic> json) => StatusHistoryResponse(
        complaintId: json['complaintId'],
        complaintType: json['complaintType'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedAt: json['lastModifiedAt'],
        id: json['id'],
        status: json['status'],
        ticketId: json['ticketId'],
        deleted: json['deleted'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['complaintId'] = complaintId;
    data['complaintType'] = complaintType;
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['lastModifiedBy'] = lastModifiedBy;
    data['lastModifiedAt'] = lastModifiedAt;
    data['id'] = id;
    data['status'] = status;
    data['ticketId'] = ticketId;
    data['deleted'] = deleted;
    return data;
  }
}
