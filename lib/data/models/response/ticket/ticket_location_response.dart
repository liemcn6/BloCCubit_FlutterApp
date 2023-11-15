class TicketLocationResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? ticketId;
  final String? buildingId;
  final String? floorId;
  final bool? deleted;
  final String? floorName;
  final String? buildingName;

  TicketLocationResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.ticketId,
    this.buildingId,
    this.floorId,
    this.deleted,
    this.floorName,
    this.buildingName,
  });

  factory TicketLocationResponse.fromJson(Map<String, dynamic> json) => TicketLocationResponse(
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedAt: json['lastModifiedAt'],
        id: json['id'],
        ticketId: json['ticketId'],
        buildingId: json['buildingId'],
        floorId: json['floorId'],
        deleted: json['deleted'],
        floorName: json['floorName'],
        buildingName: json['buildingName'],
      );

  Map<String, dynamic> toJson() => {
        'createdBy': createdBy,
        'createdAt': createdAt,
        'lastModifiedBy': lastModifiedBy,
        'lastModifiedAt': lastModifiedAt,
        'id': id,
        'ticketId': ticketId,
        'buildingId': buildingId,
        'floorId': floorId,
        'deleted': deleted,
        'floorName': floorName,
        'buildingName': buildingName,
      };
}
