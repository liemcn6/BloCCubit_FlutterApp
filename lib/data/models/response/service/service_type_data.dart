class ServiceTypeData {
  final String? areaId;
  final String? areaName;
  final String? buildingId;
  final String? buildingName;
  final String? buildingServiceId;
  final String? buildingServiceName;
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final int? endTime;
  final String? facilityGroupId;
  final String? facilityGroupName;
  final List<FacilityOption>? facilityOptions;
  final String? id;
  final IllustrationFile? illustrationFile;
  final String? illustrationFileId;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? name;
  final int? startTime;
  final String? status;
  final String? terms;
  final String? unitId;
  final String? unitName;

  ServiceTypeData({
    this.areaId,
    this.areaName,
    this.buildingId,
    this.buildingName,
    this.buildingServiceId,
    this.buildingServiceName,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endTime,
    this.facilityGroupId,
    this.facilityGroupName,
    this.facilityOptions,
    this.id,
    this.illustrationFile,
    this.illustrationFileId,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.name,
    this.startTime,
    this.status,
    this.terms,
    this.unitId,
    this.unitName,
  });

  factory ServiceTypeData.fromJson(Map<String, dynamic> json) => ServiceTypeData(
        areaId: json["areaId"],
        areaName: json["areaName"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        buildingServiceId: json["buildingServiceId"],
        buildingServiceName: json["buildingServiceName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        endTime: json["endTime"],
        facilityGroupId: json["facilityGroupId"],
        facilityGroupName: json["facilityGroupName"],
        facilityOptions: json["facilityOptions"] == null
            ? []
            : List<FacilityOption>.from(
                json["facilityOptions"]!.map((x) => FacilityOption.fromJson(x))),
        id: json["id"],
        illustrationFile: json["illustrationFile"] == null
            ? null
            : IllustrationFile.fromJson(json["illustrationFile"]),
        illustrationFileId: json["illustrationFileId"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        name: json["name"],
        startTime: json["startTime"],
        status: json["status"],
        terms: json["terms"],
        unitId: json["unitId"],
        unitName: json["unitName"],
      );

  Map<String, dynamic> toJson() => {
        "areaId": areaId,
        "areaName": areaName,
        "buildingId": buildingId,
        "buildingName": buildingName,
        "buildingServiceId": buildingServiceId,
        "buildingServiceName": buildingServiceName,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "endTime": endTime,
        "facilityGroupId": facilityGroupId,
        "facilityGroupName": facilityGroupName,
        "facilityOptions": facilityOptions == null
            ? []
            : List<dynamic>.from(facilityOptions!.map((x) => x.toJson())),
        "id": id,
        "illustrationFile": illustrationFile?.toJson(),
        "illustrationFileId": illustrationFileId,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "name": name,
        "startTime": startTime,
        "status": status,
        "terms": terms,
        "unitId": unitId,
        "unitName": unitName,
      };
}

class FacilityOption {
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final int? endTime;
  final String? facilityId;
  final String? id;
  final bool? isMaxSlot;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? note;
  final int? numberOfSlot;
  final int? startTime;
  final String? unitOfMeasureCode;
  final String? unitOfMeasureId;
  final String? unitOfMeasureName;
  final int? unitPrice;

  FacilityOption({
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endTime,
    this.facilityId,
    this.id,
    this.isMaxSlot,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.note,
    this.numberOfSlot,
    this.startTime,
    this.unitOfMeasureCode,
    this.unitOfMeasureId,
    this.unitOfMeasureName,
    this.unitPrice,
  });

  factory FacilityOption.fromJson(Map<String, dynamic> json) => FacilityOption(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        endTime: json["endTime"],
        facilityId: json["facilityId"],
        id: json["id"],
        isMaxSlot: json["isMaxSlot"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        note: json["note"],
        numberOfSlot: json["numberOfSlot"],
        startTime: json["startTime"],
        unitOfMeasureCode: json["unitOfMeasureCode"],
        unitOfMeasureId: json["unitOfMeasureId"],
        unitOfMeasureName: json["unitOfMeasureName"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "endTime": endTime,
        "facilityId": facilityId,
        "id": id,
        "isMaxSlot": isMaxSlot,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "note": note,
        "numberOfSlot": numberOfSlot,
        "startTime": startTime,
        "unitOfMeasureCode": unitOfMeasureCode,
        "unitOfMeasureId": unitOfMeasureId,
        "unitOfMeasureName": unitOfMeasureName,
        "unitPrice": unitPrice,
      };
}

class IllustrationFile {
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? downloadUrl;
  final String? hashed;
  final String? id;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? originalName;
  final String? ownerId;
  final String? ownerType;
  final String? path;
  final int? size;
  final String? type;
  final int? version;
  final String? viewUrl;

  IllustrationFile({
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.downloadUrl,
    this.hashed,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.originalName,
    this.ownerId,
    this.ownerType,
    this.path,
    this.size,
    this.type,
    this.version,
    this.viewUrl,
  });

  factory IllustrationFile.fromJson(Map<String, dynamic> json) => IllustrationFile(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        hashed: json["hashed"],
        id: json["id"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        originalName: json["originalName"],
        ownerId: json["ownerId"],
        ownerType: json["ownerType"],
        path: json["path"],
        size: json["size"],
        type: json["type"],
        version: json["version"],
        viewUrl: json["viewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "downloadUrl": downloadUrl,
        "hashed": hashed,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "originalName": originalName,
        "ownerId": ownerId,
        "ownerType": ownerType,
        "path": path,
        "size": size,
        "type": type,
        "version": version,
        "viewUrl": viewUrl,
      };
}
