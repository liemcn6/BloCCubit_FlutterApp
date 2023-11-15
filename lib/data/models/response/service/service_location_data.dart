class ServiceLocationData {
  final String? id;
  final String? facilityId;
  final int? startTime;
  final int? endTime;
  final int? numberOfSlot;
  final double? unitPrice;
  final bool? deleted;
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? unitOfMeasureId;
  final bool? isMaxSlot;
  final String? note;

  ServiceLocationData({
    this.id,
    this.facilityId,
    this.startTime,
    this.endTime,
    this.numberOfSlot,
    this.unitPrice,
    this.deleted,
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.unitOfMeasureId,
    this.isMaxSlot,
    this.note,
  });

  factory ServiceLocationData.fromJson(Map<String, dynamic> json) => ServiceLocationData(
        id: json["id"],
        facilityId: json["facilityId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        numberOfSlot: json["numberOfSlot"],
        unitPrice: json["unitPrice"] == null ? null : double.tryParse(json["unitPrice"].toString()),
        deleted: json["deleted"],
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        unitOfMeasureId: json["unitOfMeasureId"],
        isMaxSlot: json["isMaxSlot"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "facilityId": facilityId,
        "startTime": startTime,
        "endTime": endTime,
        "numberOfSlot": numberOfSlot,
        "unitPrice": unitPrice,
        "deleted": deleted,
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "unitOfMeasureId": unitOfMeasureId,
        "isMaxSlot": isMaxSlot,
        "note": note,
      };
}
