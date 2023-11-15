// To parse this JSON data, do
//
//     final vehicleHistoryDetail = vehicleHistoryDetailFromJson(jsonString);

import 'dart:convert';

VehicleHistoryDetail vehicleHistoryDetailFromJson(String str) =>
    VehicleHistoryDetail.fromJson(json.decode(str));

String vehicleHistoryDetailToJson(VehicleHistoryDetail data) => json.encode(data.toJson());

class VehicleHistoryDetail {
  final List<ApprovalHistory>? approvalHistories;
  final String? approvalStatus;
  final String? buildingId;
  final String? buildingName;
  final String? code;
  final String? contractId;
  final String? contractNumber;
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? id;
  final String? issuedUserEmail;
  final String? issuedUserFullName;
  final String? issuedUserId;
  final String? issuedUserPhoneNumber;
  final String? lastModifiedBy;
  final int? month;
  final String? organizationEmail;
  final String? organizationId;
  final String? organizationName;
  final String? organizationPhoneNumber;
  final String? parkingChargeType;
  final String? parkingTermCondition;
  final String? reason;
  final List<RegisteredVehicleStatistic>? registeredVehicleStatistics;
  final List<RegisteredVehicle>? registeredVehicles;
  final String? registrationDate;
  final String? status;
  final int? thresholdPriceDay;
  final double? totalPrice;
  final double? vat;
  final List<VehicleUnitPrice>? vehicleUnitPrices;
  final int? version;
  final bool? waitApproval;
  final int? year;

  VehicleHistoryDetail({
    this.approvalHistories,
    this.approvalStatus,
    this.buildingId,
    this.buildingName,
    this.code,
    this.contractId,
    this.contractNumber,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.id,
    this.issuedUserEmail,
    this.issuedUserFullName,
    this.issuedUserId,
    this.issuedUserPhoneNumber,
    this.lastModifiedBy,
    this.month,
    this.organizationEmail,
    this.organizationId,
    this.organizationName,
    this.organizationPhoneNumber,
    this.parkingChargeType,
    this.parkingTermCondition,
    this.reason,
    this.registeredVehicleStatistics,
    this.registeredVehicles,
    this.registrationDate,
    this.status,
    this.thresholdPriceDay,
    this.totalPrice,
    this.vat,
    this.vehicleUnitPrices,
    this.version,
    this.waitApproval,
    this.year,
  });

  VehicleHistoryDetail copyWith({
    List<ApprovalHistory>? approvalHistories,
    String? approvalStatus,
    String? buildingId,
    String? buildingName,
    String? code,
    String? contractId,
    String? contractNumber,
    int? createdAt,
    String? createdBy,
    bool? deleted,
    String? id,
    String? issuedUserEmail,
    String? issuedUserFullName,
    String? issuedUserId,
    String? issuedUserPhoneNumber,
    String? lastModifiedBy,
    int? month,
    String? organizationEmail,
    String? organizationId,
    String? organizationName,
    String? organizationPhoneNumber,
    String? parkingChargeType,
    String? parkingTermCondition,
    String? reason,
    List<RegisteredVehicleStatistic>? registeredVehicleStatistics,
    List<RegisteredVehicle>? registeredVehicles,
    String? registrationDate,
    String? status,
    int? thresholdPriceDay,
    double? totalPrice,
    double? vat,
    List<VehicleUnitPrice>? vehicleUnitPrices,
    int? version,
    bool? waitApproval,
    int? year,
  }) =>
      VehicleHistoryDetail(
        approvalHistories: approvalHistories ?? this.approvalHistories,
        approvalStatus: approvalStatus ?? this.approvalStatus,
        buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        code: code ?? this.code,
        contractId: contractId ?? this.contractId,
        contractNumber: contractNumber ?? this.contractNumber,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        deleted: deleted ?? this.deleted,
        id: id ?? this.id,
        issuedUserEmail: issuedUserEmail ?? this.issuedUserEmail,
        issuedUserFullName: issuedUserFullName ?? this.issuedUserFullName,
        issuedUserId: issuedUserId ?? this.issuedUserId,
        issuedUserPhoneNumber: issuedUserPhoneNumber ?? this.issuedUserPhoneNumber,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        month: month ?? this.month,
        organizationEmail: organizationEmail ?? this.organizationEmail,
        organizationId: organizationId ?? this.organizationId,
        organizationName: organizationName ?? this.organizationName,
        organizationPhoneNumber: organizationPhoneNumber ?? this.organizationPhoneNumber,
        parkingChargeType: parkingChargeType ?? this.parkingChargeType,
        parkingTermCondition: parkingTermCondition ?? this.parkingTermCondition,
        reason: reason ?? this.reason,
        registeredVehicleStatistics:
            registeredVehicleStatistics ?? this.registeredVehicleStatistics,
        registeredVehicles: registeredVehicles ?? this.registeredVehicles,
        registrationDate: registrationDate ?? this.registrationDate,
        status: status ?? this.status,
        thresholdPriceDay: thresholdPriceDay ?? this.thresholdPriceDay,
        totalPrice: totalPrice ?? this.totalPrice,
        vat: vat ?? this.vat,
        vehicleUnitPrices: vehicleUnitPrices ?? this.vehicleUnitPrices,
        version: version ?? this.version,
        waitApproval: waitApproval ?? this.waitApproval,
        year: year ?? this.year,
      );

  factory VehicleHistoryDetail.fromJson(Map<String, dynamic> json) => VehicleHistoryDetail(
        approvalHistories: json["approvalHistories"] == null
            ? []
            : List<ApprovalHistory>.from(
                json["approvalHistories"]!.map((x) => ApprovalHistory.fromJson(x))),
        approvalStatus: json["approvalStatus"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        code: json["code"],
        contractId: json["contractId"],
        contractNumber: json["contractNumber"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        id: json["id"],
        issuedUserEmail: json["issuedUserEmail"],
        issuedUserFullName: json["issuedUserFullName"],
        issuedUserId: json["issuedUserId"],
        issuedUserPhoneNumber: json["issuedUserPhoneNumber"],
        lastModifiedBy: json["lastModifiedBy"],
        month: json["month"],
        organizationEmail: json["organizationEmail"],
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        organizationPhoneNumber: json["organizationPhoneNumber"],
        parkingChargeType: json["parkingChargeType"],
        parkingTermCondition: json["parkingTermCondition"],
        reason: json["reason"],
        registeredVehicleStatistics: json["registeredVehicleStatistics"] == null
            ? []
            : List<RegisteredVehicleStatistic>.from(json["registeredVehicleStatistics"]!
                .map((x) => RegisteredVehicleStatistic.fromJson(x))),
        registeredVehicles: json["registeredVehicles"] == null
            ? []
            : List<RegisteredVehicle>.from(
                json["registeredVehicles"]!.map((x) => RegisteredVehicle.fromJson(x))),
        registrationDate: json["registrationDate"],
        status: json["status"],
        thresholdPriceDay: json["thresholdPriceDay"],
        totalPrice: json["totalPrice"],
        vat: json["vat"],
        vehicleUnitPrices: json["vehicleUnitPrices"] == null
            ? []
            : List<VehicleUnitPrice>.from(
                json["vehicleUnitPrices"]!.map((x) => VehicleUnitPrice.fromJson(x))),
        version: json["version"],
        waitApproval: json["waitApproval"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "approvalHistories": approvalHistories == null
            ? []
            : List<dynamic>.from(approvalHistories!.map((x) => x.toJson())),
        "approvalStatus": approvalStatus,
        "buildingId": buildingId,
        "buildingName": buildingName,
        "code": code,
        "contractId": contractId,
        "contractNumber": contractNumber,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "id": id,
        "issuedUserEmail": issuedUserEmail,
        "issuedUserFullName": issuedUserFullName,
        "issuedUserId": issuedUserId,
        "issuedUserPhoneNumber": issuedUserPhoneNumber,
        "lastModifiedBy": lastModifiedBy,
        "month": month,
        "organizationEmail": organizationEmail,
        "organizationId": organizationId,
        "organizationName": organizationName,
        "organizationPhoneNumber": organizationPhoneNumber,
        "parkingChargeType": parkingChargeType,
        "parkingTermCondition": parkingTermCondition,
        "reason": reason,
        "registeredVehicleStatistics": registeredVehicleStatistics == null
            ? []
            : List<dynamic>.from(registeredVehicleStatistics!.map((x) => x.toJson())),
        "registeredVehicles": registeredVehicles == null
            ? []
            : List<dynamic>.from(registeredVehicles!.map((x) => x.toJson())),
        "registrationDate": registrationDate,
        "status": status,
        "thresholdPriceDay": thresholdPriceDay,
        "totalPrice": totalPrice,
        "vat": vat,
        "vehicleUnitPrices": vehicleUnitPrices == null
            ? []
            : List<dynamic>.from(vehicleUnitPrices!.map((x) => x.toJson())),
        "version": version,
        "waitApproval": waitApproval,
        "year": year,
      };
}

class ApprovalHistory {
  final String? approvalStatus;
  final String? assigneeUserId;
  final int? createdAt;
  final int? expectedFinishAt;
  final int? finishAt;
  final String? id;
  final bool? isLatestWorkflow;
  final String? note;
  final String? roleId;
  final int? startAt;
  final String? userDepartmentName;
  final String? userFullName;
  final String? userTitleName;
  final String? username;
  final String? workflowId;

  ApprovalHistory({
    this.approvalStatus,
    this.assigneeUserId,
    this.createdAt,
    this.expectedFinishAt,
    this.finishAt,
    this.id,
    this.isLatestWorkflow,
    this.note,
    this.roleId,
    this.startAt,
    this.userDepartmentName,
    this.userFullName,
    this.userTitleName,
    this.username,
    this.workflowId,
  });

  ApprovalHistory copyWith({
    String? approvalStatus,
    String? assigneeUserId,
    int? createdAt,
    int? expectedFinishAt,
    int? finishAt,
    String? id,
    bool? isLatestWorkflow,
    String? note,
    String? roleId,
    int? startAt,
    String? userDepartmentName,
    String? userFullName,
    String? userTitleName,
    String? username,
    String? workflowId,
  }) =>
      ApprovalHistory(
        approvalStatus: approvalStatus ?? this.approvalStatus,
        assigneeUserId: assigneeUserId ?? this.assigneeUserId,
        createdAt: createdAt ?? this.createdAt,
        expectedFinishAt: expectedFinishAt ?? this.expectedFinishAt,
        finishAt: finishAt ?? this.finishAt,
        id: id ?? this.id,
        isLatestWorkflow: isLatestWorkflow ?? this.isLatestWorkflow,
        note: note ?? this.note,
        roleId: roleId ?? this.roleId,
        startAt: startAt ?? this.startAt,
        userDepartmentName: userDepartmentName ?? this.userDepartmentName,
        userFullName: userFullName ?? this.userFullName,
        userTitleName: userTitleName ?? this.userTitleName,
        username: username ?? this.username,
        workflowId: workflowId ?? this.workflowId,
      );

  factory ApprovalHistory.fromJson(Map<String, dynamic> json) => ApprovalHistory(
        approvalStatus: json["approvalStatus"],
        assigneeUserId: json["assigneeUserId"],
        createdAt: json["createdAt"],
        expectedFinishAt: json["expectedFinishAt"],
        finishAt: json["finishAt"],
        id: json["id"],
        isLatestWorkflow: json["isLatestWorkflow"],
        note: json["note"],
        roleId: json["roleId"],
        startAt: json["startAt"],
        userDepartmentName: json["userDepartmentName"],
        userFullName: json["userFullName"],
        userTitleName: json["userTitleName"],
        username: json["username"],
        workflowId: json["workflowId"],
      );

  Map<String, dynamic> toJson() => {
        "approvalStatus": approvalStatus,
        "assigneeUserId": assigneeUserId,
        "createdAt": createdAt,
        "expectedFinishAt": expectedFinishAt,
        "finishAt": finishAt,
        "id": id,
        "isLatestWorkflow": isLatestWorkflow,
        "note": note,
        "roleId": roleId,
        "startAt": startAt,
        "userDepartmentName": userDepartmentName,
        "userFullName": userFullName,
        "userTitleName": userTitleName,
        "username": username,
        "workflowId": workflowId,
      };
}

class RegisteredVehicleStatistic {
  final String? buildingServiceId;
  final String? code;
  final String? id;
  final String? name;
  final int? total;

  RegisteredVehicleStatistic({
    this.buildingServiceId,
    this.code,
    this.id,
    this.name,
    this.total,
  });

  RegisteredVehicleStatistic copyWith({
    String? buildingServiceId,
    String? code,
    String? id,
    String? name,
    int? total,
  }) =>
      RegisteredVehicleStatistic(
        buildingServiceId: buildingServiceId ?? this.buildingServiceId,
        code: code ?? this.code,
        id: id ?? this.id,
        name: name ?? this.name,
        total: total ?? this.total,
      );

  factory RegisteredVehicleStatistic.fromJson(Map<String, dynamic> json) =>
      RegisteredVehicleStatistic(
        buildingServiceId: json["buildingServiceId"],
        code: json["code"],
        id: json["id"],
        name: json["name"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "buildingServiceId": buildingServiceId,
        "code": code,
        "id": id,
        "name": name,
        "total": total,
      };
}

class RegisteredVehicle {
  final String? buildingId;
  final String? buildingServiceId;
  final String? color;
  final String? contractId;
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final DateTime? endDate;
  final List<FileElement>? files;
  final String? id;
  final String? identification;
  final bool? isReduce;
  final String? lastModifiedBy;
  final String? licensePlate;
  final String? licensePlateCode;
  final String? manufacturer;
  final String? model;
  final String? note;
  final String? organizationId;
  final String? ownerName;
  final String? ownerPhoneNumber;
  final String? parkingRegistrationId;
  final String? parkingTicketId;
  final String? registrationDate;
  final String? startDate;
  final double? totalPrice;
  final double? unitPrice;
  final String? vehicleId;
  final String? vehicleTypeId;
  final String? vehicleTypeName;
  final int? version;

  RegisteredVehicle({
    this.buildingId,
    this.buildingServiceId,
    this.color,
    this.contractId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endDate,
    this.files,
    this.id,
    this.identification,
    this.isReduce,
    this.lastModifiedBy,
    this.licensePlate,
    this.licensePlateCode,
    this.manufacturer,
    this.model,
    this.note,
    this.organizationId,
    this.ownerName,
    this.ownerPhoneNumber,
    this.parkingRegistrationId,
    this.parkingTicketId,
    this.registrationDate,
    this.startDate,
    this.totalPrice,
    this.unitPrice,
    this.vehicleId,
    this.vehicleTypeId,
    this.vehicleTypeName,
    this.version,
  });

  RegisteredVehicle copyWith({
    String? buildingId,
    String? buildingServiceId,
    String? color,
    String? contractId,
    int? createdAt,
    String? createdBy,
    bool? deleted,
    DateTime? endDate,
    List<FileElement>? files,
    String? id,
    String? identification,
    bool? isReduce,
    String? lastModifiedBy,
    String? licensePlate,
    String? licensePlateCode,
    String? manufacturer,
    String? model,
    String? note,
    String? organizationId,
    String? ownerName,
    String? ownerPhoneNumber,
    String? parkingRegistrationId,
    String? parkingTicketId,
    String? registrationDate,
    String? startDate,
    double? totalPrice,
    double? unitPrice,
    String? vehicleId,
    String? vehicleTypeId,
    String? vehicleTypeName,
    int? version,
  }) =>
      RegisteredVehicle(
        buildingId: buildingId ?? this.buildingId,
        buildingServiceId: buildingServiceId ?? this.buildingServiceId,
        color: color ?? this.color,
        contractId: contractId ?? this.contractId,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        deleted: deleted ?? this.deleted,
        endDate: endDate ?? this.endDate,
        files: files ?? this.files,
        id: id ?? this.id,
        identification: identification ?? this.identification,
        isReduce: isReduce ?? this.isReduce,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        licensePlate: licensePlate ?? this.licensePlate,
        licensePlateCode: licensePlateCode ?? this.licensePlateCode,
        manufacturer: manufacturer ?? this.manufacturer,
        model: model ?? this.model,
        note: note ?? this.note,
        organizationId: organizationId ?? this.organizationId,
        ownerName: ownerName ?? this.ownerName,
        ownerPhoneNumber: ownerPhoneNumber ?? this.ownerPhoneNumber,
        parkingRegistrationId: parkingRegistrationId ?? this.parkingRegistrationId,
        parkingTicketId: parkingTicketId ?? this.parkingTicketId,
        registrationDate: registrationDate ?? this.registrationDate,
        startDate: startDate ?? this.startDate,
        totalPrice: totalPrice ?? this.totalPrice,
        unitPrice: unitPrice ?? this.unitPrice,
        vehicleId: vehicleId ?? this.vehicleId,
        vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
        vehicleTypeName: vehicleTypeName ?? this.vehicleTypeName,
        version: version ?? this.version,
      );

  factory RegisteredVehicle.fromJson(Map<String, dynamic> json) => RegisteredVehicle(
        buildingId: json["buildingId"],
        buildingServiceId: json["buildingServiceId"],
        color: json["color"],
        contractId: json["contractId"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        files: json["files"] == null
            ? []
            : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
        id: json["id"],
        identification: json["identification"],
        isReduce: json["isReduce"],
        lastModifiedBy: json["lastModifiedBy"],
        licensePlate: json["licensePlate"],
        licensePlateCode: json["licensePlateCode"],
        manufacturer: json["manufacturer"],
        model: json["model"],
        note: json["note"],
        organizationId: json["organizationId"],
        ownerName: json["ownerName"],
        ownerPhoneNumber: json["ownerPhoneNumber"],
        parkingRegistrationId: json["parkingRegistrationId"],
        parkingTicketId: json["parkingTicketId"],
        registrationDate: json["registrationDate"],
        startDate: json["startDate"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"],
        vehicleId: json["vehicleId"],
        vehicleTypeId: json["vehicleTypeId"],
        vehicleTypeName: json["vehicleTypeName"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "buildingServiceId": buildingServiceId,
        "color": color,
        "contractId": contractId,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "id": id,
        "identification": identification,
        "isReduce": isReduce,
        "lastModifiedBy": lastModifiedBy,
        "licensePlate": licensePlate,
        "licensePlateCode": licensePlateCode,
        "manufacturer": manufacturer,
        "model": model,
        "note": note,
        "organizationId": organizationId,
        "ownerName": ownerName,
        "ownerPhoneNumber": ownerPhoneNumber,
        "parkingRegistrationId": parkingRegistrationId,
        "parkingTicketId": parkingTicketId,
        "registrationDate": registrationDate,
        "startDate": startDate,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "vehicleId": vehicleId,
        "vehicleTypeId": vehicleTypeId,
        "vehicleTypeName": vehicleTypeName,
        "version": version,
      };
}

class FileElement {
  final String? createdBy;
  final bool? deleted;
  final String? downloadUrl;
  final String? fileId;
  final String? id;
  final String? lastModifiedBy;
  final String? originalName;
  final String? parkingTicketId;
  final String? vehicleId;
  final int? version;
  final String? viewUrl;

  FileElement({
    this.createdBy,
    this.deleted,
    this.downloadUrl,
    this.fileId,
    this.id,
    this.lastModifiedBy,
    this.originalName,
    this.parkingTicketId,
    this.vehicleId,
    this.version,
    this.viewUrl,
  });

  FileElement copyWith({
    String? createdBy,
    bool? deleted,
    String? downloadUrl,
    String? fileId,
    String? id,
    String? lastModifiedBy,
    String? originalName,
    String? parkingTicketId,
    String? vehicleId,
    int? version,
    String? viewUrl,
  }) =>
      FileElement(
        createdBy: createdBy ?? this.createdBy,
        deleted: deleted ?? this.deleted,
        downloadUrl: downloadUrl ?? this.downloadUrl,
        fileId: fileId ?? this.fileId,
        id: id ?? this.id,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        originalName: originalName ?? this.originalName,
        parkingTicketId: parkingTicketId ?? this.parkingTicketId,
        vehicleId: vehicleId ?? this.vehicleId,
        version: version ?? this.version,
        viewUrl: viewUrl ?? this.viewUrl,
      );

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        fileId: json["fileId"],
        id: json["id"],
        lastModifiedBy: json["lastModifiedBy"],
        originalName: json["originalName"],
        parkingTicketId: json["parkingTicketId"],
        vehicleId: json["vehicleId"],
        version: json["version"],
        viewUrl: json["viewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "deleted": deleted,
        "downloadUrl": downloadUrl,
        "fileId": fileId,
        "id": id,
        "lastModifiedBy": lastModifiedBy,
        "originalName": originalName,
        "parkingTicketId": parkingTicketId,
        "vehicleId": vehicleId,
        "version": version,
        "viewUrl": viewUrl,
      };
}

class VehicleUnitPrice {
  final String? buildingId;
  final String? buildingServiceId;
  final String? contractId;
  final String? effectiveDate;
  final String? expirationDate;
  final bool? inLeasingPrice;
  final int? maxQuantity;
  final int? minQuantity;
  final String? organizationId;
  final int? quantity;
  final double? unitPrice;
  final String? vehicleTypeName;

  VehicleUnitPrice({
    this.buildingId,
    this.buildingServiceId,
    this.contractId,
    this.effectiveDate,
    this.expirationDate,
    this.inLeasingPrice,
    this.maxQuantity,
    this.minQuantity,
    this.organizationId,
    this.quantity,
    this.unitPrice,
    this.vehicleTypeName,
  });

  VehicleUnitPrice copyWith({
    String? buildingId,
    String? buildingServiceId,
    String? contractId,
    String? effectiveDate,
    String? expirationDate,
    bool? inLeasingPrice,
    int? maxQuantity,
    int? minQuantity,
    String? organizationId,
    int? quantity,
    double? unitPrice,
    String? vehicleTypeName,
  }) =>
      VehicleUnitPrice(
        buildingId: buildingId ?? this.buildingId,
        buildingServiceId: buildingServiceId ?? this.buildingServiceId,
        contractId: contractId ?? this.contractId,
        effectiveDate: effectiveDate ?? this.effectiveDate,
        expirationDate: expirationDate ?? this.expirationDate,
        inLeasingPrice: inLeasingPrice ?? this.inLeasingPrice,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        minQuantity: minQuantity ?? this.minQuantity,
        organizationId: organizationId ?? this.organizationId,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        vehicleTypeName: vehicleTypeName ?? this.vehicleTypeName,
      );

  factory VehicleUnitPrice.fromJson(Map<String, dynamic> json) => VehicleUnitPrice(
        buildingId: json["buildingId"],
        buildingServiceId: json["buildingServiceId"],
        contractId: json["contractId"],
        effectiveDate: json["effectiveDate"],
        expirationDate: json["expirationDate"],
        inLeasingPrice: json["inLeasingPrice"],
        maxQuantity: json["maxQuantity"],
        minQuantity: json["minQuantity"],
        organizationId: json["organizationId"],
        quantity: json["quantity"],
        unitPrice: json["unitPrice"],
        vehicleTypeName: json["vehicleTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "buildingServiceId": buildingServiceId,
        "contractId": contractId,
        "effectiveDate": effectiveDate,
        "expirationDate": expirationDate,
        "inLeasingPrice": inLeasingPrice,
        "maxQuantity": maxQuantity,
        "minQuantity": minQuantity,
        "organizationId": organizationId,
        "quantity": quantity,
        "unitPrice": unitPrice,
        "vehicleTypeName": vehicleTypeName,
      };
}
