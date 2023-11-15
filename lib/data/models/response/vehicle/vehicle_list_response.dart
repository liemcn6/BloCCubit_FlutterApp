import 'dart:convert';

class VehicleListResponse {
  int? code;
  List<Datum>? data;
  String? message;
  Page? page;
  String? status;
  bool? success;
  int? timestamp;

  VehicleListResponse({
    this.code,
    this.data,
    this.message,
    this.page,
    this.status,
    this.success,
    this.timestamp,
  });

  factory VehicleListResponse.fromRawJson(String str) =>
      VehicleListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleListResponse.fromJson(Map<String, dynamic> json) => VehicleListResponse(
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
  String? color;
  String? contractId;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  DateTime? endDate;
  List<FileElement>? files;
  List<History>? histories;
  String? id;
  String? identification;
  bool? isCanceled;
  bool? isReduce;
  int? lastGenPeriodMonth;
  int? lastGenPeriodYear;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? licensePlate;
  String? licensePlateCode;
  String? manufacturer;
  String? model;
  int? month;
  List<MonthlyTransaction>? monthlyTransactions;
  String? note;
  String? organizationId;
  String? organizationName;
  String? ownerName;
  String? ownerPhoneNumber;
  String? parkingChargeType;
  double? realPrice;
  DateTime? registrationDate;
  DateTime? startDate;
  String? status;
  int? thresholdPriceDay;
  double? totalPrice;
  double? unitPrice;
  String? vehicleId;
  List<VehicleMonthlyFee>? vehicleMonthlyFees;
  String? vehicleTypeId;
  String? vehicleTypeName;
  int? version;
  String? viewParkingChargeType;
  int? year;

  Datum({
    this.approvalStatus,
    this.buildingId,
    this.buildingName,
    this.color,
    this.contractId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endDate,
    this.files,
    this.histories,
    this.id,
    this.identification,
    this.isCanceled,
    this.isReduce,
    this.lastGenPeriodMonth,
    this.lastGenPeriodYear,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.licensePlate,
    this.licensePlateCode,
    this.manufacturer,
    this.model,
    this.month,
    this.monthlyTransactions,
    this.note,
    this.organizationId,
    this.organizationName,
    this.ownerName,
    this.ownerPhoneNumber,
    this.parkingChargeType,
    this.realPrice,
    this.registrationDate,
    this.startDate,
    this.status,
    this.thresholdPriceDay,
    this.totalPrice,
    this.unitPrice,
    this.vehicleId,
    this.vehicleMonthlyFees,
    this.vehicleTypeId,
    this.vehicleTypeName,
    this.version,
    this.viewParkingChargeType,
    this.year,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        approvalStatus: json["approvalStatus"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
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
        histories: json["histories"] == null
            ? []
            : List<History>.from(json["histories"]!.map((x) => History.fromJson(x))),
        id: json["id"],
        identification: json["identification"],
        isCanceled: json["isCanceled"],
        isReduce: json["isReduce"],
        lastGenPeriodMonth: json["lastGenPeriodMonth"],
        lastGenPeriodYear: json["lastGenPeriodYear"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        licensePlate: json["licensePlate"],
        licensePlateCode: json["licensePlateCode"],
        manufacturer: json["manufacturer"],
        model: json["model"],
        month: json["month"],
        monthlyTransactions: json["monthlyTransactions"] == null
            ? []
            : List<MonthlyTransaction>.from(
                json["monthlyTransactions"]!.map((x) => MonthlyTransaction.fromJson(x))),
        note: json["note"],
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        ownerName: json["ownerName"],
        ownerPhoneNumber: json["ownerPhoneNumber"],
        parkingChargeType: json["parkingChargeType"],
        realPrice: json["realPrice"],
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        status: json["status"],
        thresholdPriceDay: json["thresholdPriceDay"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"],
        vehicleId: json["vehicleId"],
        vehicleMonthlyFees: json["vehicleMonthlyFees"] == null
            ? []
            : List<VehicleMonthlyFee>.from(
                json["vehicleMonthlyFees"]!.map((x) => VehicleMonthlyFee.fromJson(x))),
        vehicleTypeId: json["vehicleTypeId"],
        vehicleTypeName: json["vehicleTypeName"],
        version: json["version"],
        viewParkingChargeType: json["viewParkingChargeType"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "approvalStatus": approvalStatus,
        "buildingId": buildingId,
        "buildingName": buildingName,
        "color": color,
        "contractId": contractId,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "histories": histories == null ? [] : List<dynamic>.from(histories!.map((x) => x.toJson())),
        "id": id,
        "identification": identification,
        "isCanceled": isCanceled,
        "isReduce": isReduce,
        "lastGenPeriodMonth": lastGenPeriodMonth,
        "lastGenPeriodYear": lastGenPeriodYear,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "licensePlate": licensePlate,
        "licensePlateCode": licensePlateCode,
        "manufacturer": manufacturer,
        "model": model,
        "month": month,
        "monthlyTransactions": monthlyTransactions == null
            ? []
            : List<dynamic>.from(monthlyTransactions!.map((x) => x.toJson())),
        "note": note,
        "organizationId": organizationId,
        "organizationName": organizationName,
        "ownerName": ownerName,
        "ownerPhoneNumber": ownerPhoneNumber,
        "parkingChargeType": parkingChargeType,
        "realPrice": realPrice,
        "registrationDate":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "thresholdPriceDay": thresholdPriceDay,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "vehicleId": vehicleId,
        "vehicleMonthlyFees": vehicleMonthlyFees == null
            ? []
            : List<dynamic>.from(vehicleMonthlyFees!.map((x) => x.toJson())),
        "vehicleTypeId": vehicleTypeId,
        "vehicleTypeName": vehicleTypeName,
        "version": version,
        "viewParkingChargeType": viewParkingChargeType,
        "year": year,
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        fileId: json["fileId"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
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

class History {
  String? action;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  String? id;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? licensePlate;
  String? parkingTicketId;
  String? vehicleId;

  History({
    this.action,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.licensePlate,
    this.parkingTicketId,
    this.vehicleId,
  });

  factory History.fromRawJson(String str) => History.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory History.fromJson(Map<String, dynamic> json) => History(
        action: json["action"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        id: json["id"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        licensePlate: json["licensePlate"],
        parkingTicketId: json["parkingTicketId"],
        vehicleId: json["vehicleId"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "licensePlate": licensePlate,
        "parkingTicketId": parkingTicketId,
        "vehicleId": vehicleId,
      };
}

class MonthlyTransaction {
  String? buildingId;
  String? buildingName;
  String? buildingServiceId;
  String? buildingServiceName;
  String? buildingServiceUnit;
  String? contractId;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  DateTime? endDate;
  String? floorId;
  String? floorName;
  String? glCode;
  String? id;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  int? monthPeriod;
  String? note;
  String? organizationId;
  String? organizationName;
  double? originalPrice;
  double? originalPriceWithVat;
  String? periodId;
  String? periodTransactionId;
  double? quantity;
  double? quantityUnit;
  String? sourceId;
  DateTime? startDate;
  String? status;
  double? totalPrice;
  double? totalPriceWithVat;
  String? unitId;
  String? unitName;
  double? unitPrice;
  double? unitPriceWithVat;
  double? vat;
  int? version;
  int? yearPeriod;

  MonthlyTransaction({
    this.buildingId,
    this.buildingName,
    this.buildingServiceId,
    this.buildingServiceName,
    this.buildingServiceUnit,
    this.contractId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endDate,
    this.floorId,
    this.floorName,
    this.glCode,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.monthPeriod,
    this.note,
    this.organizationId,
    this.organizationName,
    this.originalPrice,
    this.originalPriceWithVat,
    this.periodId,
    this.periodTransactionId,
    this.quantity,
    this.quantityUnit,
    this.sourceId,
    this.startDate,
    this.status,
    this.totalPrice,
    this.totalPriceWithVat,
    this.unitId,
    this.unitName,
    this.unitPrice,
    this.unitPriceWithVat,
    this.vat,
    this.version,
    this.yearPeriod,
  });

  factory MonthlyTransaction.fromRawJson(String str) =>
      MonthlyTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MonthlyTransaction.fromJson(Map<String, dynamic> json) => MonthlyTransaction(
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        buildingServiceId: json["buildingServiceId"],
        buildingServiceName: json["buildingServiceName"],
        buildingServiceUnit: json["buildingServiceUnit"],
        contractId: json["contractId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        floorId: json["floorId"],
        floorName: json["floorName"],
        glCode: json["glCode"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        monthPeriod: json["monthPeriod"],
        note: json["note"],
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        originalPrice: json["originalPrice"],
        originalPriceWithVat: json["originalPriceWithVat"],
        periodId: json["periodId"],
        periodTransactionId: json["periodTransactionId"],
        quantity: json["quantity"],
        quantityUnit: json["quantityUnit"],
        sourceId: json["sourceId"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        status: json["status"],
        totalPrice: json["totalPrice"],
        totalPriceWithVat: json["totalPriceWithVat"],
        unitId: json["unitId"],
        unitName: json["unitName"],
        unitPrice: json["unitPrice"],
        unitPriceWithVat: json["unitPriceWithVat"],
        vat: json["vat"],
        version: json["version"],
        yearPeriod: json["yearPeriod"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "buildingName": buildingName,
        "buildingServiceId": buildingServiceId,
        "buildingServiceName": buildingServiceName,
        "buildingServiceUnit": buildingServiceUnit,
        "contractId": contractId,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "floorId": floorId,
        "floorName": floorName,
        "glCode": glCode,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "monthPeriod": monthPeriod,
        "note": note,
        "organizationId": organizationId,
        "organizationName": organizationName,
        "originalPrice": originalPrice,
        "originalPriceWithVat": originalPriceWithVat,
        "periodId": periodId,
        "periodTransactionId": periodTransactionId,
        "quantity": quantity,
        "quantityUnit": quantityUnit,
        "sourceId": sourceId,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "totalPrice": totalPrice,
        "totalPriceWithVat": totalPriceWithVat,
        "unitId": unitId,
        "unitName": unitName,
        "unitPrice": unitPrice,
        "unitPriceWithVat": unitPriceWithVat,
        "vat": vat,
        "version": version,
        "yearPeriod": yearPeriod,
      };
}

class VehicleMonthlyFee {
  String? buildingName;
  String? contractId;
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  DateTime? endDate;
  String? id;
  bool? isGenPeriod;
  bool? isReduce;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  int? month;
  String? organizationName;
  String? parkingChargeType;
  String? parkingPriceType;
  String? parkingTicketId;
  double? realPrice;
  DateTime? startDate;
  int? thresholdPriceDay;
  double? totalPrice;
  double? unitPrice;
  String? vehicleId;
  String? vehicleTypeName;
  int? year;

  VehicleMonthlyFee({
    this.buildingName,
    this.contractId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endDate,
    this.id,
    this.isGenPeriod,
    this.isReduce,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.month,
    this.organizationName,
    this.parkingChargeType,
    this.parkingPriceType,
    this.parkingTicketId,
    this.realPrice,
    this.startDate,
    this.thresholdPriceDay,
    this.totalPrice,
    this.unitPrice,
    this.vehicleId,
    this.vehicleTypeName,
    this.year,
  });

  factory VehicleMonthlyFee.fromRawJson(String str) => VehicleMonthlyFee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleMonthlyFee.fromJson(Map<String, dynamic> json) => VehicleMonthlyFee(
        buildingName: json["buildingName"],
        contractId: json["contractId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        id: json["id"],
        isGenPeriod: json["isGenPeriod"],
        isReduce: json["isReduce"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        month: json["month"],
        organizationName: json["organizationName"],
        parkingChargeType: json["parkingChargeType"],
        parkingPriceType: json["parkingPriceType"],
        parkingTicketId: json["parkingTicketId"],
        realPrice: json["realPrice"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        thresholdPriceDay: json["thresholdPriceDay"],
        totalPrice: json["totalPrice"],
        unitPrice: json["unitPrice"],
        vehicleId: json["vehicleId"],
        vehicleTypeName: json["vehicleTypeName"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "buildingName": buildingName,
        "contractId": contractId,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "id": id,
        "isGenPeriod": isGenPeriod,
        "isReduce": isReduce,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "month": month,
        "organizationName": organizationName,
        "parkingChargeType": parkingChargeType,
        "parkingPriceType": parkingPriceType,
        "parkingTicketId": parkingTicketId,
        "realPrice": realPrice,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "thresholdPriceDay": thresholdPriceDay,
        "totalPrice": totalPrice,
        "unitPrice": unitPrice,
        "vehicleId": vehicleId,
        "vehicleTypeName": vehicleTypeName,
        "year": year,
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
