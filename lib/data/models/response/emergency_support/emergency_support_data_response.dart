import 'package:flutter/foundation.dart';

@immutable
class EmergencySupportDataResponse {
  final String? buildingCode;
  final String? buildingId;
  final String? buildingName;
  final int? createdAt;
  final String? createdBy;
  final bool deleted;
  final String? id;
  final int? lastModifiedAt;
  final String? lastModifiedBy;
  final String? phoneNumber;
  final int? priority;
  final String? status;
  final String? title;

  const EmergencySupportDataResponse({
    this.buildingCode,
    this.buildingId,
    this.buildingName,
    this.createdAt,
    this.createdBy,
    this.deleted = false,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.phoneNumber,
    this.priority,
    this.status,
    this.title,
  });

  factory EmergencySupportDataResponse.fromJson(Map<String, dynamic> json) =>
      EmergencySupportDataResponse(
        buildingCode: json['buildingCode'] as String?,
        buildingId: json['buildingId'] as String?,
        buildingName: json['buildingName'] as String?,
        createdAt: json['createdAt'] as int?,
        createdBy: json['createdBy'] as String?,
        deleted: json['deleted'] as bool? ?? false,
        id: json['id'] as String?,
        lastModifiedAt: json['lastModifiedAt'] as int?,
        lastModifiedBy: json['lastModifiedBy'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        priority: json['priority'] as int?,
        status: json['status'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'buildingCode': buildingCode,
        'buildingId': buildingId,
        'buildingName': buildingName,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'deleted': deleted,
        'id': id,
        'lastModifiedAt': lastModifiedAt,
        'lastModifiedBy': lastModifiedBy,
        'phoneNumber': phoneNumber,
        'priority': priority,
        'status': status,
        'title': title,
      };
}
