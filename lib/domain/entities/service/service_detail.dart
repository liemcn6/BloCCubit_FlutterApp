import 'package:home_care/data/models/response/service/service_list_response.dart';

class ServiceDetail {
  // final String? areaId;
  final String? areaName;

  // final String? buildingId;
  final String? buildingName;

  // final String? buildingServiceId;
  // final String? buildingServiceName;
  // final bool? deleted;
  final int? endTime;
  final String? facilityGroupId;

  // final String? facilityGroupName;
  final List<FacilityOption>? facilityOptions;
  final String? id;
  final IllustrationFile? illustrationFile;

  // final String? illustrationFileId;
  // final String? lastModifiedBy;
  final String? name;
  final int? startTime;

  // final String? status;
  final String? terms;

  // final String? unitId;
  final String? unitName;

  ServiceDetail({
    //this.areaId,
    this.areaName,
    //this.buildingId,
    this.buildingName,
    //this.buildingServiceId,
    //this.buildingServiceName,
    //this.deleted,
    this.endTime,
    this.facilityGroupId,
    //this.facilityGroupName,
    this.facilityOptions,
    this.id,
    this.illustrationFile,
    //this.illustrationFileId,
    //this.lastModifiedBy,
    this.name,
    this.startTime,
    //this.status,
    this.terms,
    //this.unitId,
    this.unitName,
  });
}

class FacilityOption {
  final bool? deleted;
  final bool? isMaxSlot;
  final int? endTime;
  final String? facilityId;
  final String? id;
  final String? lastModifiedBy;
  final int? maxPersonOfUnit;
  final String? note;
  final int? startTime;
  final String? unitOfMeasureCode;
  final String? unitOfMeasureId;
  final String? unitOfMeasureName;
  final double? unitPrice;

  FacilityOption({
    this.deleted,
    this.isMaxSlot,
    this.endTime,
    this.facilityId,
    this.id,
    this.lastModifiedBy,
    this.maxPersonOfUnit,
    this.note,
    this.startTime,
    this.unitOfMeasureCode,
    this.unitOfMeasureId,
    this.unitOfMeasureName,
    this.unitPrice,
  });

  FacilityOption copyWith({
    bool? deleted,
    bool? isMaxSlot,
    int? endTime,
    String? facilityId,
    String? id,
    String? lastModifiedBy,
    int? maxPersonOfUnit,
    String? note,
    int? startTime,
    String? unitOfMeasureCode,
    String? unitOfMeasureId,
    String? unitOfMeasureName,
    double? unitPrice,
  }) =>
      FacilityOption(
        deleted: deleted ?? this.deleted,
        isMaxSlot: isMaxSlot ?? this.isMaxSlot,
        endTime: endTime ?? this.endTime,
        facilityId: facilityId ?? this.facilityId,
        id: id ?? this.id,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        maxPersonOfUnit: maxPersonOfUnit ?? this.maxPersonOfUnit,
        note: note ?? this.note,
        startTime: startTime ?? this.startTime,
        unitOfMeasureCode: unitOfMeasureCode ?? this.unitOfMeasureCode,
        unitOfMeasureId: unitOfMeasureId ?? this.unitOfMeasureId,
        unitOfMeasureName: unitOfMeasureName ?? this.unitOfMeasureName,
        unitPrice: unitPrice ?? this.unitPrice,
      );

  factory FacilityOption.fromJson(Map<String, dynamic> json) => FacilityOption(
        deleted: json["deleted"],
        isMaxSlot: json["isMaxSlot"],
        endTime: json["endTime"],
        facilityId: json["facilityId"],
        id: json["id"],
        lastModifiedBy: json["lastModifiedBy"],
        maxPersonOfUnit: json["maxPersonOfUnit"],
        note: json["note"],
        startTime: json["startTime"],
        unitOfMeasureCode: json["unitOfMeasureCode"],
        unitOfMeasureId: json["unitOfMeasureId"],
        unitOfMeasureName: json["unitOfMeasureName"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toJson() => {
        "deleted": deleted,
        "isMaxSlot": isMaxSlot,
        "endTime": endTime,
        "facilityId": facilityId,
        "id": id,
        "lastModifiedBy": lastModifiedBy,
        "maxPersonOfUnit": maxPersonOfUnit,
        "note": note,
        "startTime": startTime,
        "unitOfMeasureCode": unitOfMeasureCode,
        "unitOfMeasureId": unitOfMeasureId,
        "unitOfMeasureName": unitOfMeasureName,
        "unitPrice": unitPrice,
      };
}

class ServiceDetailStatus {
  static const String active = "ACTIVE";
}
