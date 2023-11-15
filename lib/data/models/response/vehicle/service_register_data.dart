// To parse this JSON data, do
//
//     final serviceHistory = serviceHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:home_care/domain/entities/service/service_history_detail.dart';

ServiceRegisterData serviceHistoryFromJson(String str) => ServiceRegisterData.fromJson(json.decode(str));

String serviceHistoryToJson(ServiceRegisterData data) => json.encode(data.toJson());

class ServiceRegisterData {
  final List<ApprovalHistory>? approvalHistories;
  final String? approvalStatus;
  final String? areaId;
  final String? areaName;
  final String? buildingId;
  final String? buildingName;
  final String? buildingServiceId;
  final String? buildingServiceName;
  final String? customerId;
  final String? customerName;
  final bool? deleted;
  final int? endTime;
  final String? facilityGroupId;
  final String? facilityGroupName;
  final String? facilityId;
  final String? facilityName;
  final String? facilityOptionId;
  final String? floorId;
  final List<ServiceHistoryDetail>? histories;
  final String? id;
  final String? issuedUserId;
  final double? quantity;
  final String? registrationDate;
  final int? startTime;
  final String? status;
  final double? totalAmount;
  final String? unitId;
  final String? unitName;
  final double? unitPrice;
  final String? userFullName;
  final bool? waitApproval;
  final ServiceRegisterData? latestVersion;

  ServiceRegisterData({
    this.approvalHistories,
    this.approvalStatus,
    this.areaId,
    this.areaName,
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
    this.histories,
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

  ServiceRegisterData copyWith({
    List<ApprovalHistory>? approvalHistories,
    String? approvalStatus,
    String? areaId,
    String? areaName,
    String? buildingId,
    String? buildingName,
    String? buildingServiceId,
    String? buildingServiceName,
    String? customerId,
    String? customerName,
    bool? deleted,
    int? endTime,
    String? facilityGroupId,
    String? facilityGroupName,
    String? facilityId,
    String? facilityName,
    String? facilityOptionId,
    String? floorId,
    List<ServiceHistoryDetail>? histories,
    String? id,
    String? issuedUserId,
    double? quantity,
    String? registrationDate,
    int? startTime,
    String? status,
    double? totalAmount,
    String? unitId,
    String? unitName,
    double? unitPrice,
    String? userFullName,
    bool? waitApproval,
    ServiceRegisterData? latestVersion,
  }) =>
      ServiceRegisterData(
        approvalHistories: approvalHistories ?? this.approvalHistories,
        approvalStatus: approvalStatus ?? this.approvalStatus,
        areaId: areaId ?? this.areaId,
        areaName: areaName ?? this.areaName,
        buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        buildingServiceId: buildingServiceId ?? this.buildingServiceId,
        buildingServiceName: buildingServiceName ?? this.buildingServiceName,
        customerId: customerId ?? this.customerId,
        customerName: customerName ?? this.customerName,
        deleted: deleted ?? this.deleted,
        endTime: endTime ?? this.endTime,
        facilityGroupId: facilityGroupId ?? this.facilityGroupId,
        facilityGroupName: facilityGroupName ?? this.facilityGroupName,
        facilityId: facilityId ?? this.facilityId,
        facilityName: facilityName ?? this.facilityName,
        facilityOptionId: facilityOptionId ?? this.facilityOptionId,
        floorId: floorId ?? this.floorId,
        histories: histories ?? this.histories,
        id: id ?? this.id,
        issuedUserId: issuedUserId ?? this.issuedUserId,
        quantity: quantity ?? this.quantity,
        registrationDate: registrationDate ?? this.registrationDate,
        startTime: startTime ?? this.startTime,
        status: status ?? this.status,
        totalAmount: totalAmount ?? this.totalAmount,
        unitId: unitId ?? this.unitId,
        unitName: unitName ?? this.unitName,
        unitPrice: unitPrice ?? this.unitPrice,
        userFullName: userFullName ?? this.userFullName,
        waitApproval: waitApproval ?? this.waitApproval,
        latestVersion : latestVersion ?? this.latestVersion,
      );

  factory ServiceRegisterData.fromJson(Map<String, dynamic> json) => ServiceRegisterData(
    approvalHistories: json["approvalHistories"] == null ? [] : List<ApprovalHistory>.from(json["approvalHistories"]!.map((x) => ApprovalHistory.fromJson(x))),
    approvalStatus: json["approvalStatus"],
    areaId: json["areaId"],
    areaName: json["areaName"],
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
    histories: json["histories"] == null ? [] : List<ServiceHistoryDetail>.from(json["histories"]!.map((x) => ServiceHistoryDetail.fromJson(x))),
    id: json["id"],
    issuedUserId: json["issuedUserId"],
    quantity: json["quantity"],
    registrationDate: json["registrationDate"],
    startTime: json["startTime"],
    status: json["status"],
    totalAmount: json["totalAmount"],
    unitId: json["unitId"],
    unitName: json["unitName"],
    unitPrice: json["unitPrice"],
    userFullName: json["userFullName"],
    waitApproval: json["waitApproval"],
    latestVersion: json["latestVersion"] == null ? null : ServiceRegisterData.fromJson(json["latestVersion"]),

  );

  Map<String, dynamic> toJson() => {
    "approvalHistories": approvalHistories == null ? [] : List<dynamic>.from(approvalHistories!.map((x) => x.toJson())),
    "approvalStatus": approvalStatus,
    "areaId": areaId,
    "areaName": areaName,
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
    "histories": histories == null ? [] : List<dynamic>.from(histories!.map((x) => x.toJson())),
    "id": id,
    "issuedUserId": issuedUserId,
    "quantity": quantity,
    "registrationDate": registrationDate,
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

class ApprovalHistory {
  final String? approvalStatus;
  final String? assigneeUserId;
  final String? id;
  final bool? isLatestWorkflow;
  final String? note;
  final String? roleId;
  final String? userDepartmentName;
  final String? userFullName;
  final String? userTitleName;
  final String? username;
  final String? workflowId;

  ApprovalHistory({
    this.approvalStatus,
    this.assigneeUserId,
    this.id,
    this.isLatestWorkflow,
    this.note,
    this.roleId,
    this.userDepartmentName,
    this.userFullName,
    this.userTitleName,
    this.username,
    this.workflowId,
  });

  ApprovalHistory copyWith({
    String? approvalStatus,
    String? assigneeUserId,
    String? id,
    bool? isLatestWorkflow,
    String? note,
    String? roleId,
    String? userDepartmentName,
    String? userFullName,
    String? userTitleName,
    String? username,
    String? workflowId,
  }) =>
      ApprovalHistory(
        approvalStatus: approvalStatus ?? this.approvalStatus,
        assigneeUserId: assigneeUserId ?? this.assigneeUserId,
        id: id ?? this.id,
        isLatestWorkflow: isLatestWorkflow ?? this.isLatestWorkflow,
        note: note ?? this.note,
        roleId: roleId ?? this.roleId,
        userDepartmentName: userDepartmentName ?? this.userDepartmentName,
        userFullName: userFullName ?? this.userFullName,
        userTitleName: userTitleName ?? this.userTitleName,
        username: username ?? this.username,
        workflowId: workflowId ?? this.workflowId,
      );

  factory ApprovalHistory.fromJson(Map<String, dynamic> json) => ApprovalHistory(
    approvalStatus: json["approvalStatus"],
    assigneeUserId: json["assigneeUserId"],
    id: json["id"],
    isLatestWorkflow: json["isLatestWorkflow"],
    note: json["note"],
    roleId: json["roleId"],
    userDepartmentName: json["userDepartmentName"],
    userFullName: json["userFullName"],
    userTitleName: json["userTitleName"],
    username: json["username"],
    workflowId: json["workflowId"],
  );

  Map<String, dynamic> toJson() => {
    "approvalStatus": approvalStatus,
    "assigneeUserId": assigneeUserId,
    "id": id,
    "isLatestWorkflow": isLatestWorkflow,
    "note": note,
    "roleId": roleId,
    "userDepartmentName": userDepartmentName,
    "userFullName": userFullName,
    "userTitleName": userTitleName,
    "username": username,
    "workflowId": workflowId,
  };
}
