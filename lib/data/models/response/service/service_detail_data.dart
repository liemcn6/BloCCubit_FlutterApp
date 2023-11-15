// To parse this JSON data, do
//
//     final serviceDetail = serviceDetailFromJson(jsonString);

import 'dart:convert';

import 'package:home_care/data/models/response/service/service_list_response.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';

ServiceDetailData serviceDetailFromJson(String str) => ServiceDetailData.fromJson(json.decode(str));

String serviceDetailToJson(ServiceDetailData data) => json.encode(data.toJson());

class ServiceDetailData {
  final String? areaId;
  final String? areaName;
  final String? buildingId;
  final String? buildingName;
  final String? buildingServiceId;
  final String? buildingServiceName;
  final bool? deleted;
  final int? endTime;
  final String? facilityGroupId;
  final String? facilityGroupName;
  final List<FacilityOption>? facilityOptions;
  final String? id;
  final IllustrationFile? illustrationFile;
  final String? illustrationFileId;
  final String? lastModifiedBy;
  final String? name;
  final int? startTime;
  final String? status;
  final String? terms;
  final String? unitId;
  final String? unitName;

  ServiceDetailData({
    this.areaId,
    this.areaName,
    this.buildingId,
    this.buildingName,
    this.buildingServiceId,
    this.buildingServiceName,
    this.deleted,
    this.endTime,
    this.facilityGroupId,
    this.facilityGroupName,
    this.facilityOptions,
    this.id,
    this.illustrationFile,
    this.illustrationFileId,
    this.lastModifiedBy,
    this.name,
    this.startTime,
    this.status,
    this.terms,
    this.unitId,
    this.unitName,
  });

  ServiceDetailData copyWith({
    String? areaId,
    String? areaName,
    String? buildingId,
    String? buildingName,
    String? buildingServiceId,
    String? buildingServiceName,
    bool? deleted,
    int? endTime,
    String? facilityGroupId,
    String? facilityGroupName,
    List<FacilityOption>? facilityOptions,
    String? id,
    IllustrationFile? illustrationFile,
    String? illustrationFileId,
    String? lastModifiedBy,
    String? name,
    int? startTime,
    String? status,
    String? terms,
    String? unitId,
    String? unitName,
  }) =>
      ServiceDetailData(
        areaId: areaId ?? this.areaId,
        areaName: areaName ?? this.areaName,
        buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        buildingServiceId: buildingServiceId ?? this.buildingServiceId,
        buildingServiceName: buildingServiceName ?? this.buildingServiceName,
        deleted: deleted ?? this.deleted,
        endTime: endTime ?? this.endTime,
        facilityGroupId: facilityGroupId ?? this.facilityGroupId,
        facilityGroupName: facilityGroupName ?? this.facilityGroupName,
        facilityOptions: facilityOptions ?? this.facilityOptions,
        id: id ?? this.id,
        illustrationFile: illustrationFile ?? this.illustrationFile,
        illustrationFileId: illustrationFileId ?? this.illustrationFileId,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        name: name ?? this.name,
        startTime: startTime ?? this.startTime,
        status: status ?? this.status,
        terms: terms ?? this.terms,
        unitId: unitId ?? this.unitId,
        unitName: unitName ?? this.unitName,
      );

  factory ServiceDetailData.fromJson(Map<String, dynamic> json) => ServiceDetailData(
        areaId: json["areaId"],
        areaName: json["areaName"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        buildingServiceId: json["buildingServiceId"],
        buildingServiceName: json["buildingServiceName"],
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
        "lastModifiedBy": lastModifiedBy,
        "name": name,
        "startTime": startTime,
        "status": status,
        "terms": terms,
        "unitId": unitId,
        "unitName": unitName,
      };
}
