import 'dart:convert';

class ServiceHistoryResponse {
  int? code;
  List<Datum>? data;
  String? message;
  Page? page;
  String? status;
  bool? success;
  int? timestamp;

  ServiceHistoryResponse({
    this.code,
    this.data,
    this.message,
    this.page,
    this.status,
    this.success,
    this.timestamp,
  });

  factory ServiceHistoryResponse.fromRawJson(String str) =>
      ServiceHistoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceHistoryResponse.fromJson(Map<String, dynamic> json) => ServiceHistoryResponse(
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
  String? approvalStatus;
  String? buildingId;
  String? buildingName;
  String? buildingServiceId;
  String? buildingServiceName;
  String? customerId;
  String? customerName;
  bool? deleted;
  int? endTime;
  String? facilityGroupId;
  String? facilityGroupName;
  String? facilityId;
  String? facilityName;
  String? facilityOptionId;
  String? floorId;
  String? id;
  String? issuedUserId;
  double? quantity;
  DateTime? registrationDate;
  int? startTime;
  String? status;
  double? totalAmount;
  String? unitId;
  String? unitName;
  double? unitPrice;
  String? userFullName;
  bool? waitApproval;
  LatestVersion? latestVersion;

  Datum({
    this.approvalStatus,
    this.buildingId,
    this.buildingName,
    this.buildingServiceId,
    this.buildingServiceName,
    this.customerId,
    this.customerName,
    this.deleted,
    this.endTime,
    this.facilityGroupId,
    this.facilityGroupName,
    this.facilityId,
    this.facilityName,
    this.facilityOptionId,
    this.floorId,
    this.id,
    this.issuedUserId,
    this.quantity,
    this.registrationDate,
    this.startTime,
    this.status,
    this.totalAmount,
    this.unitId,
    this.unitName,
    this.unitPrice,
    this.userFullName,
    this.waitApproval,
    this.latestVersion,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        approvalStatus: json["approvalStatus"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        buildingServiceId: json["buildingServiceId"],
        buildingServiceName: json["buildingServiceName"],
        customerId: json["customerId"],
        customerName: json["customerName"],
        deleted: json["deleted"],
        endTime: json["endTime"],
        facilityGroupId: json["facilityGroupId"],
        facilityGroupName: json["facilityGroupName"],
        facilityId: json["facilityId"],
        facilityName: json["facilityName"],
        facilityOptionId: json["facilityOptionId"],
        floorId: json["floorId"],
        id: json["id"],
        issuedUserId: json["issuedUserId"],
        quantity: json["quantity"],
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        startTime: json["startTime"],
        status: json["status"],
        totalAmount: json["totalAmount"],
        unitId: json["unitId"],
        unitName: json["unitName"],
        unitPrice: json["unitPrice"],
        userFullName: json["userFullName"],
        waitApproval: json["waitApproval"],
        latestVersion:
            json["latestVersion"] == null ? null : LatestVersion.fromJson(json["latestVersion"]),
      );

  Map<String, dynamic> toJson() => {
        "approvalStatus": approvalStatus,
        "buildingId": buildingId,
        "buildingName": buildingName,
        "buildingServiceId": buildingServiceId,
        "buildingServiceName": buildingServiceName,
        "customerId": customerId,
        "customerName": customerName,
        "deleted": deleted,
        "endTime": endTime,
        "facilityGroupId": facilityGroupId,
        "facilityGroupName": facilityGroupName,
        "facilityId": facilityId,
        "facilityName": facilityName,
        "facilityOptionId": facilityOptionId,
        "floorId": floorId,
        "id": id,
        "issuedUserId": issuedUserId,
        "quantity": quantity,
        "registrationDate":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "startTime": startTime,
        "status": status,
        "totalAmount": totalAmount,
        "unitId": unitId,
        "unitName": unitName,
        "unitPrice": unitPrice,
        "userFullName": userFullName,
        "waitApproval": waitApproval,
        "latestVersion": latestVersion?.toJson(),
      };
}

class LatestVersion {
  String? approvalStatus;
  String? buildingId;
  String? buildingServiceId;
  String? customerId;
  bool? deleted;
  int? endTime;
  String? facilityGroupId;
  String? facilityId;
  String? facilityOptionId;
  String? floorId;
  String? id;
  String? issuedUserId;
  double? quantity;
  DateTime? registrationDate;
  int? startTime;
  String? status;
  double? totalAmount;
  double? unitPrice;

  LatestVersion({
    this.approvalStatus,
    this.buildingId,
    this.buildingServiceId,
    this.customerId,
    this.deleted,
    this.endTime,
    this.facilityGroupId,
    this.facilityId,
    this.facilityOptionId,
    this.floorId,
    this.id,
    this.issuedUserId,
    this.quantity,
    this.registrationDate,
    this.startTime,
    this.status,
    this.totalAmount,
    this.unitPrice,
  });

  factory LatestVersion.fromRawJson(String str) => LatestVersion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LatestVersion.fromJson(Map<String, dynamic> json) => LatestVersion(
        approvalStatus: json["approvalStatus"],
        buildingId: json["buildingId"],
        buildingServiceId: json["buildingServiceId"],
        customerId: json["customerId"],
        deleted: json["deleted"],
        endTime: json["endTime"],
        facilityGroupId: json["facilityGroupId"],
        facilityId: json["facilityId"],
        facilityOptionId: json["facilityOptionId"],
        floorId: json["floorId"],
        id: json["id"],
        issuedUserId: json["issuedUserId"],
        quantity: json["quantity"],
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        startTime: json["startTime"],
        status: json["status"],
        totalAmount: json["totalAmount"],
        unitPrice: json["unitPrice"],
      );

  Map<String, dynamic> toJson() => {
        "approvalStatus": approvalStatus,
        "buildingId": buildingId,
        "buildingServiceId": buildingServiceId,
        "customerId": customerId,
        "deleted": deleted,
        "endTime": endTime,
        "facilityGroupId": facilityGroupId,
        "facilityId": facilityId,
        "facilityOptionId": facilityOptionId,
        "floorId": floorId,
        "id": id,
        "issuedUserId": issuedUserId,
        "quantity": quantity,
        "registrationDate":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "startTime": startTime,
        "status": status,
        "totalAmount": totalAmount,
        "unitPrice": unitPrice,
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
