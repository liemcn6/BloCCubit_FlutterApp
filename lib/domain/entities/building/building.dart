import 'package:home_care/domain/entities/building/floor.dart';

class Building {
  final String? address;
  final String? approvalStatus;
  final String? branchCode;
  final String? branchGlCode;
  final String? branchId;
  final String? branchName;
  final String? buildingClassId;
  final String? buildingClassName;
  final String? code;
  final int? commissioningDate;
  final int? createdAt;
  final String? districtCode;
  final List<Floor>? floors;
  final String? id;
  final int? lastModifiedAt;
  final String? name;
  final int? parkingChargeDate;
  final String? parkingChargeType;
  final String? parkingTermCondition;
  final String? provinceCode;
  final String? regionCode;
  final String? status;
  final int? totalArea;
  final int? totalBasement;
  final int? totalFloor;
  final String? wardCode;

  Building({
    this.address,
    this.approvalStatus,
    this.branchCode,
    this.branchGlCode,
    this.branchId,
    this.branchName,
    this.buildingClassId,
    this.buildingClassName,
    this.code,
    this.commissioningDate,
    this.createdAt,
    this.districtCode,
    this.floors,
    this.id,
    this.lastModifiedAt,
    this.name,
    this.parkingChargeDate,
    this.parkingChargeType,
    this.parkingTermCondition,
    this.provinceCode,
    this.regionCode,
    this.status,
    this.totalArea,
    this.totalBasement,
    this.totalFloor,
    this.wardCode,
  });

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        address: json["address"],
        approvalStatus: json["approvalStatus"],
        branchCode: json["branchCode"],
        branchGlCode: json["branchGlCode"],
        branchId: json["branchId"],
        branchName: json["branchName"],
        buildingClassId: json["buildingClassId"],
        buildingClassName: json["buildingClassName"],
        code: json["code"],
        commissioningDate: json["commissioningDate"],
        createdAt: json["createdAt"],
        districtCode: json["districtCode"],
        floors: json["floors"] == null
            ? []
            : List<Floor>.from(json["floors"]!.map((x) => Floor.fromJson(x))),
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"],
        name: json["name"],
        parkingChargeDate: json["parkingChargeDate"],
        parkingChargeType: json["parkingChargeType"],
        parkingTermCondition: json["parkingTermCondition"],
        provinceCode: json["provinceCode"],
        regionCode: json["regionCode"],
        status: json["status"],
        totalArea: json["totalArea"],
        totalBasement: json["totalBasement"],
        totalFloor: json["totalFloor"],
        wardCode: json["wardCode"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "approvalStatus": approvalStatus,
        "branchCode": branchCode,
        "branchGlCode": branchGlCode,
        "branchId": branchId,
        "branchName": branchName,
        "buildingClassId": buildingClassId,
        "buildingClassName": buildingClassName,
        "code": code,
        "commissioningDate": commissioningDate,
        "createdAt": createdAt,
        "districtCode": districtCode,
        "floors": floors == null ? [] : List<dynamic>.from(floors!.map((x) => x.toJson())),
        "id": id,
        "lastModifiedAt": lastModifiedAt,
        "name": name,
        "parkingChargeDate": parkingChargeDate,
        "parkingChargeType": parkingChargeType,
        "parkingTermCondition": parkingTermCondition,
        "provinceCode": provinceCode,
        "regionCode": regionCode,
        "status": status,
        "totalArea": totalArea,
        "totalBasement": totalBasement,
        "totalFloor": totalFloor,
        "wardCode": wardCode,
      };
}
