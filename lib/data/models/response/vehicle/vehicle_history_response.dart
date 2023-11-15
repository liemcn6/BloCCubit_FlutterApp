import 'dart:convert';

class VehicleHistoryResponse {
  int? code;
  List<Datum>? data;
  String? message;
  Page? page;
  String? status;
  bool? success;
  int? timestamp;

  VehicleHistoryResponse({
    this.code,
    this.data,
    this.message,
    this.page,
    this.status,
    this.success,
    this.timestamp,
  });

  factory VehicleHistoryResponse.fromRawJson(String str) =>
      VehicleHistoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleHistoryResponse.fromJson(Map<String, dynamic> json) => VehicleHistoryResponse(
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
  List<ApprovalHistory>? approvalHistories;
  String? approvalStatus;
  String? buildingId;
  String? buildingName;
  String? code;
  String? contractId;
  String? contractNumber;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  String? id;
  String? issuedUserEmail;
  String? issuedUserFullName;
  String? issuedUserId;
  String? issuedUserPhoneNumber;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  int? month;
  String? organizationEmail;
  String? organizationId;
  String? organizationName;
  String? organizationPhoneNumber;
  String? parkingChargeType;
  String? parkingTermCondition;
  String? reason;
  List<RegisteredVehicleStatistic>? registeredVehicleStatistics;
  List<RegisteredVehicle>? registeredVehicles;
  DateTime? registrationDate;
  String? status;
  int? thresholdPriceDay;
  double? totalPrice;
  int? vat;
  List<VehicleUnitPrice>? vehicleUnitPrices;
  int? version;
  bool? waitApproval;
  int? year;

  Datum({
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
    this.lastModifiedAt,
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        id: json["id"],
        issuedUserEmail: json["issuedUserEmail"],
        issuedUserFullName: json["issuedUserFullName"],
        issuedUserId: json["issuedUserId"],
        issuedUserPhoneNumber: json["issuedUserPhoneNumber"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
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
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        status: json["status"],
        thresholdPriceDay: json["thresholdPriceDay"],
        totalPrice: double.tryParse(json["totalPrice"].toString()),
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
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "id": id,
        "issuedUserEmail": issuedUserEmail,
        "issuedUserFullName": issuedUserFullName,
        "issuedUserId": issuedUserId,
        "issuedUserPhoneNumber": issuedUserPhoneNumber,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
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
        "registrationDate":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
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
  String? approvalStatus;
  String? assigneeUserId;
  DateTime? createdAt;
  DateTime? expectedFinishAt;
  DateTime? finishAt;
  String? id;
  bool? isLatestWorkflow;
  String? note;
  String? roleId;
  DateTime? startAt;
  String? userDepartmentName;
  String? userFullName;
  String? userTitleName;
  String? username;
  String? workflowId;

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

  factory ApprovalHistory.fromRawJson(String str) => ApprovalHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApprovalHistory.fromJson(Map<String, dynamic> json) => ApprovalHistory(
        approvalStatus: json["approvalStatus"],
        assigneeUserId: json["assigneeUserId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        expectedFinishAt:
            json["expectedFinishAt"] == null ? null : DateTime.parse(json["expectedFinishAt"]),
        finishAt: json["finishAt"] == null ? null : DateTime.parse(json["finishAt"]),
        id: json["id"],
        isLatestWorkflow: json["isLatestWorkflow"],
        note: json["note"],
        roleId: json["roleId"],
        startAt: json["startAt"] == null ? null : DateTime.parse(json["startAt"]),
        userDepartmentName: json["userDepartmentName"],
        userFullName: json["userFullName"],
        userTitleName: json["userTitleName"],
        username: json["username"],
        workflowId: json["workflowId"],
      );

  Map<String, dynamic> toJson() => {
        "approvalStatus": approvalStatus,
        "assigneeUserId": assigneeUserId,
        "createdAt": createdAt?.toIso8601String(),
        "expectedFinishAt": expectedFinishAt?.toIso8601String(),
        "finishAt": finishAt?.toIso8601String(),
        "id": id,
        "isLatestWorkflow": isLatestWorkflow,
        "note": note,
        "roleId": roleId,
        "startAt": startAt?.toIso8601String(),
        "userDepartmentName": userDepartmentName,
        "userFullName": userFullName,
        "userTitleName": userTitleName,
        "username": username,
        "workflowId": workflowId,
      };
}

class RegisteredVehicleStatistic {
  String? buildingServiceId;
  String? code;
  String? id;
  String? name;
  int? total;

  RegisteredVehicleStatistic({
    this.buildingServiceId,
    this.code,
    this.id,
    this.name,
    this.total,
  });

  factory RegisteredVehicleStatistic.fromRawJson(String str) =>
      RegisteredVehicleStatistic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  String? buildingId;
  String? buildingServiceId;
  String? color;
  String? contractId;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  DateTime? endDate;
  List<FileElement>? files;
  String? id;
  String? identification;
  bool? isReduce;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? licensePlate;
  String? licensePlateCode;
  String? manufacturer;
  String? model;
  String? note;
  String? organizationId;
  String? ownerName;
  String? ownerPhoneNumber;
  String? parkingRegistrationId;
  String? parkingTicketId;
  DateTime? registrationDate;
  DateTime? startDate;
  double? totalPrice;
  double? unitPrice;
  String? vehicleId;
  String? vehicleTypeId;
  String? vehicleTypeName;
  int? version;

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
    this.lastModifiedAt,
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

  factory RegisteredVehicle.fromRawJson(String str) => RegisteredVehicle.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisteredVehicle.fromJson(Map<String, dynamic> json) => RegisteredVehicle(
        buildingId: json["buildingId"],
        buildingServiceId: json["buildingServiceId"],
        color: json["color"],
        contractId: json["contractId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        files: json["files"] == null
            ? []
            : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
        id: json["id"],
        identification: json["identification"],
        isReduce: json["isReduce"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
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
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
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
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "id": id,
        "identification": identification,
        "isReduce": isReduce,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
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
        "registrationDate":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "vehicleId": vehicleId,
        "vehicleTypeId": vehicleTypeId,
        "vehicleTypeName": vehicleTypeName,
        "version": version,
      };
}

class FileElement {
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  String? downloadUrl;
  String? fileId;
  String? id;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? originalName;
  String? parkingTicketId;
  String? vehicleId;
  int? version;
  String? viewUrl;

  FileElement({
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.downloadUrl,
    this.fileId,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.originalName,
    this.parkingTicketId,
    this.vehicleId,
    this.version,
    this.viewUrl,
  });

  factory FileElement.fromRawJson(String str) => FileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        fileId: json["fileId"],
        id: json["id"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        originalName: json["originalName"],
        parkingTicketId: json["parkingTicketId"],
        vehicleId: json["vehicleId"],
        version: json["version"],
        viewUrl: json["viewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "downloadUrl": downloadUrl,
        "fileId": fileId,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "originalName": originalName,
        "parkingTicketId": parkingTicketId,
        "vehicleId": vehicleId,
        "version": version,
        "viewUrl": viewUrl,
      };
}

class VehicleUnitPrice {
  String? buildingId;
  String? buildingServiceId;
  String? contractId;
  DateTime? effectiveDate;
  DateTime? expirationDate;
  bool? inLeasingPrice;
  int? maxQuantity;
  int? minQuantity;
  String? organizationId;
  int? quantity;
  int? unitPrice;
  String? vehicleTypeName;

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

  factory VehicleUnitPrice.fromRawJson(String str) => VehicleUnitPrice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleUnitPrice.fromJson(Map<String, dynamic> json) => VehicleUnitPrice(
        buildingId: json["buildingId"],
        buildingServiceId: json["buildingServiceId"],
        contractId: json["contractId"],
        effectiveDate: json["effectiveDate"] == null ? null : DateTime.parse(json["effectiveDate"]),
        expirationDate:
            json["expirationDate"] == null ? null : DateTime.parse(json["expirationDate"]),
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
        "effectiveDate":
            "${effectiveDate!.year.toString().padLeft(4, '0')}-${effectiveDate!.month.toString().padLeft(2, '0')}-${effectiveDate!.day.toString().padLeft(2, '0')}",
        "expirationDate":
            "${expirationDate!.year.toString().padLeft(4, '0')}-${expirationDate!.month.toString().padLeft(2, '0')}-${expirationDate!.day.toString().padLeft(2, '0')}",
        "inLeasingPrice": inLeasingPrice,
        "maxQuantity": maxQuantity,
        "minQuantity": minQuantity,
        "organizationId": organizationId,
        "quantity": quantity,
        "unitPrice": unitPrice,
        "vehicleTypeName": vehicleTypeName,
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
