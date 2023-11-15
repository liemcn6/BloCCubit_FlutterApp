class VehicleTypeDataResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? vehicleTypeId;
  final String? buildingId;
  final int? numberOfSlot;
  final bool? deleted;
  final String? vehicleTypeName;
  final int? priority;
  final String? buildingName;
  final String? vehicleTypeCode;

  VehicleTypeDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.vehicleTypeId,
    this.buildingId,
    this.numberOfSlot,
    this.deleted,
    this.vehicleTypeName,
    this.priority,
    this.buildingName,
    this.vehicleTypeCode,
  });

  factory VehicleTypeDataResponse.fromJson(Map<String, dynamic> json) => VehicleTypeDataResponse(
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        id: json["id"],
        vehicleTypeId: json["vehicleTypeId"],
        buildingId: json["buildingId"],
        numberOfSlot: json["numberOfSlot"],
        deleted: json["deleted"],
        vehicleTypeName: json["vehicleTypeName"],
        priority: json["priority"],
        buildingName: json["buildingName"],
        vehicleTypeCode: json["vehicleTypeCode"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "id": id,
        "vehicleTypeId": vehicleTypeId,
        "buildingId": buildingId,
        "numberOfSlot": numberOfSlot,
        "deleted": deleted,
        "vehicleTypeName": vehicleTypeName,
        "priority": priority,
        "buildingName": buildingName,
        "vehicleTypeCode": vehicleTypeCode,
      };
}
