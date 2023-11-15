class UserLocation {
  final String? buildingId;
  final String? buildingName;
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? id;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? organizationId;
  final String? userId;

  UserLocation({
    this.buildingId,
    this.buildingName,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.organizationId,
    this.userId,
  });

  factory UserLocation.fromJson(Map<String, dynamic> json) => UserLocation(
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        id: json["id"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        organizationId: json["organizationId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "buildingName": buildingName,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "organizationId": organizationId,
        "userId": userId,
      };
}
