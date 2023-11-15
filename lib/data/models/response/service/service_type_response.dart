import 'dart:convert';

class ServiceHistoryTypeResponse {
  int? code;
  List<Datum>? data;
  String? message;
  Page? page;
  String? status;
  bool? success;
  int? timestamp;

  ServiceHistoryTypeResponse({
    this.code,
    this.data,
    this.message,
    this.page,
    this.status,
    this.success,
    this.timestamp,
  });

  factory ServiceHistoryTypeResponse.fromRawJson(String str) =>
      ServiceHistoryTypeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceHistoryTypeResponse.fromJson(Map<String, dynamic> json) =>
      ServiceHistoryTypeResponse(
        code: json["code"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
        status: json["status"],
        success: json["success"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "page": page?.toJson(),
        "status": status,
        "success": success,
        "timestamp": timestamp,
      };
}

class Datum {
  String? areaId;
  String? areaName;
  String? buildingId;
  String? buildingName;
  String? buildingServiceId;
  String? buildingServiceName;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  int? endTime;
  String? facilityGroupId;
  String? facilityGroupName;
  List<FacilityOption>? facilityOptions;
  String? id;
  IllustrationFile? illustrationFile;
  String? illustrationFileId;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? name;
  int? startTime;
  String? status;
  String? terms;
  String? unitId;
  String? unitName;

  Datum({
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  int? endTime;
  String? facilityId;
  String? id;
  bool? isMaxSlot;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? note;
  int? numberOfSlot;
  int? startTime;
  String? unitOfMeasureCode;
  String? unitOfMeasureId;
  String? unitOfMeasureName;
  int? unitPrice;

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

  factory FacilityOption.fromRawJson(String str) => FacilityOption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  String? downloadUrl;
  String? hashed;
  String? id;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? originalName;
  String? ownerId;
  String? ownerType;
  String? path;
  int? size;
  String? type;
  int? version;
  String? viewUrl;

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

  factory IllustrationFile.fromRawJson(String str) => IllustrationFile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class Page {
  int? pageIndex;
  int? pageSize;
  int? total;

  Page({
    this.pageIndex,
    this.pageSize,
    this.total,
  });

  factory Page.fromRawJson(String str) => Page.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "total": total,
      };
}
