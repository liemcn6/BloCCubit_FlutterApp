import 'dart:convert';

class BillListResponse {
  final int? code;
  final List<Datum>? data;
  final String? message;
  final Page? page;
  final String? status;
  final bool? success;
  final int? timestamp;

  BillListResponse({
    this.code,
    this.data,
    this.message,
    this.page,
    this.status,
    this.success,
    this.timestamp,
  });

  factory BillListResponse.fromRawJson(String str) => BillListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BillListResponse.fromJson(Map<String, dynamic> json) => BillListResponse(
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
  final DateTime? adjustDate;
  final String? buildingCode;
  final String? buildingId;
  final String? buildingName;
  final String? buildingServiceId;
  final String? buildingServiceName;
  final DateTime? createdAt;
  final String? createdBy;
  final String? customerTypeName;
  final bool? deleted;
  final String? explainAdjust;
  final String? glCode;
  final String? id;
  final String? invoiceIssuingAddress;
  final String? invoiceNumber;
  final List<InvoicePaymentHistory>? invoicePaymentHistories;
  final String? invoiceRequestNumber;
  final DateTime? issuedDate;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? note;
  final String? organizationCode;
  final String? organizationId;
  final String? organizationName;
  final String? organizationType;
  final String? paymentNotificationNumber;
  final List<InvoicePaymentHistory>? paymentTransactions;
  final List<PeriodTransaction>? periodTransactions;
  final String? status;
  final String? tenantId;
  final String? tenantName;
  final double? totalAmount;
  final double? totalAmountExpected;
  final double? totalPaidAmount;
  final int? version;
  final int? yearPeriod;

  Datum({
    this.adjustDate,
    this.buildingCode,
    this.buildingId,
    this.buildingName,
    this.buildingServiceId,
    this.buildingServiceName,
    this.createdAt,
    this.createdBy,
    this.customerTypeName,
    this.deleted,
    this.explainAdjust,
    this.glCode,
    this.id,
    this.invoiceIssuingAddress,
    this.invoiceNumber,
    this.invoicePaymentHistories,
    this.invoiceRequestNumber,
    this.issuedDate,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.note,
    this.organizationCode,
    this.organizationId,
    this.organizationName,
    this.organizationType,
    this.paymentNotificationNumber,
    this.paymentTransactions,
    this.periodTransactions,
    this.status,
    this.tenantId,
    this.tenantName,
    this.totalAmount,
    this.totalAmountExpected,
    this.totalPaidAmount,
    this.version,
    this.yearPeriod,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        adjustDate: json["adjustDate"] == null ? null : DateTime.parse(json["adjustDate"]),
        buildingCode: json["buildingCode"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        buildingServiceId: json["buildingServiceId"],
        buildingServiceName: json["buildingServiceName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        customerTypeName: json["customerTypeName"],
        deleted: json["deleted"],
        explainAdjust: json["explainAdjust"],
        glCode: json["glCode"],
        id: json["id"],
        invoiceIssuingAddress: json["invoiceIssuingAddress"],
        invoiceNumber: json["invoiceNumber"],
        invoicePaymentHistories: json["invoicePaymentHistories"] == null
            ? []
            : List<InvoicePaymentHistory>.from(
                json["invoicePaymentHistories"]!.map((x) => InvoicePaymentHistory.fromJson(x))),
        invoiceRequestNumber: json["invoiceRequestNumber"],
        issuedDate: json["issuedDate"] == null ? null : DateTime.parse(json["issuedDate"]),
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        note: json["note"],
        organizationCode: json["organizationCode"],
        organizationId: json["organizationId"],
        organizationName: json["organizationName"],
        organizationType: json["organizationType"],
        paymentNotificationNumber: json["paymentNotificationNumber"],
        paymentTransactions: json["paymentTransactions"] == null
            ? []
            : List<InvoicePaymentHistory>.from(
                json["paymentTransactions"]!.map((x) => InvoicePaymentHistory.fromJson(x))),
        periodTransactions: json["periodTransactions"] == null
            ? []
            : List<PeriodTransaction>.from(
                json["periodTransactions"]!.map((x) => PeriodTransaction.fromJson(x))),
        status: json["status"],
        tenantId: json["tenantId"],
        tenantName: json["tenantName"],
        totalAmount: json["totalAmount"],
        totalAmountExpected: json["totalAmountExpected"],
        totalPaidAmount: json["totalPaidAmount"],
        version: json["version"],
        yearPeriod: json["yearPeriod"],
      );

  Map<String, dynamic> toJson() => {
        "adjustDate":
            "${adjustDate!.year.toString().padLeft(4, '0')}-${adjustDate!.month.toString().padLeft(2, '0')}-${adjustDate!.day.toString().padLeft(2, '0')}",
        "buildingCode": buildingCode,
        "buildingId": buildingId,
        "buildingName": buildingName,
        "buildingServiceId": buildingServiceId,
        "buildingServiceName": buildingServiceName,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "customerTypeName": customerTypeName,
        "deleted": deleted,
        "explainAdjust": explainAdjust,
        "glCode": glCode,
        "id": id,
        "invoiceIssuingAddress": invoiceIssuingAddress,
        "invoiceNumber": invoiceNumber,
        "invoicePaymentHistories": invoicePaymentHistories == null
            ? []
            : List<dynamic>.from(invoicePaymentHistories!.map((x) => x.toJson())),
        "invoiceRequestNumber": invoiceRequestNumber,
        "issuedDate":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "note": note,
        "organizationCode": organizationCode,
        "organizationId": organizationId,
        "organizationName": organizationName,
        "organizationType": organizationType,
        "paymentNotificationNumber": paymentNotificationNumber,
        "paymentTransactions": paymentTransactions == null
            ? []
            : List<dynamic>.from(paymentTransactions!.map((x) => x.toJson())),
        "periodTransactions": periodTransactions == null
            ? []
            : List<dynamic>.from(periodTransactions!.map((x) => x.toJson())),
        "status": status,
        "tenantId": tenantId,
        "tenantName": tenantName,
        "totalAmount": totalAmount,
        "totalAmountExpected": totalAmountExpected,
        "totalPaidAmount": totalPaidAmount,
        "version": version,
        "yearPeriod": yearPeriod,
      };
}

class InvoicePaymentHistory {
  final double? amount;
  final String? bankAccountNumber;
  final String? bankId;
  final String? bankName;
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? id;
  final String? invoiceId;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? note;
  final String? paymentMethod;
  final DateTime? transactionDate;
  final String? periodTransactionId;
  final String? type;

  InvoicePaymentHistory({
    this.amount,
    this.bankAccountNumber,
    this.bankId,
    this.bankName,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.id,
    this.invoiceId,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.note,
    this.paymentMethod,
    this.transactionDate,
    this.periodTransactionId,
    this.type,
  });

  factory InvoicePaymentHistory.fromRawJson(String str) =>
      InvoicePaymentHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InvoicePaymentHistory.fromJson(Map<String, dynamic> json) => InvoicePaymentHistory(
        amount: json["amount"],
        bankAccountNumber: json["bankAccountNumber"],
        bankId: json["bankId"],
        bankName: json["bankName"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        id: json["id"],
        invoiceId: json["invoiceId"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        note: json["note"],
        paymentMethod: json["paymentMethod"],
        transactionDate:
            json["transactionDate"] == null ? null : DateTime.parse(json["transactionDate"]),
        periodTransactionId: json["periodTransactionId"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "bankAccountNumber": bankAccountNumber,
        "bankId": bankId,
        "bankName": bankName,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "id": id,
        "invoiceId": invoiceId,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "note": note,
        "paymentMethod": paymentMethod,
        "transactionDate":
            "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
        "periodTransactionId": periodTransactionId,
        "type": type,
      };
}

class PeriodTransaction {
  final DateTime? adjustDate;
  final List<AttachedFileElement>? attachedFiles;
  final String? branchGlCode;
  final String? buildingCode;
  final String? buildingId;
  final String? buildingName;
  final String? buildingServiceCode;
  final String? buildingServiceId;
  final String? buildingServiceName;
  final String? businessCode;
  final String? contractId;
  final String? contractName;
  final String? contractNumber;
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final bool? editable;
  final DateTime? endDate;
  final String? explainAdjust;
  final List<FileElement>? files;
  final String? floorCode;
  final String? floorId;
  final String? floorName;
  final String? genMode;
  final String? glCode;
  final String? id;
  final String? invoiceId;
  final String? invoiceIssuingAddress;
  final String? invoiceIssuingEmails;
  final String? invoiceNumber;
  final String? invoiceRequestNumber;
  final String? invoiceRequestStatus;
  final bool? isPrepaidService;
  final bool? isSubService;
  final DateTime? issuedDate;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final List<MonthlyTransaction>? monthlyTransactions;
  final String? note;
  final String? organizationCode;
  final String? organizationId;
  final String? organizationMail;
  final String? organizationName;
  final String? organizationType;
  final String? parentBusinessCode;
  final String? parentInvoiceIssuingAddress;
  final String? parentInvoiceIssuingEmails;
  final String? parentOrganizationCode;
  final String? parentOrganizationId;
  final String? parentOrganizationMail;
  final String? parentOrganizationName;
  final String? parentOrganizationType;
  final String? paymentNotificationId;
  final String? paymentNotificationNumber;
  final String? paymentNotificationStatus;
  final String? paymentStatus;
  final String? periodId;
  final List<AttachedFileElement>? periodTransactionFiles;
  final DateTime? provisionalForPeriod;
  final String? provisionalStatus;
  final double? quantity;
  final String? quantityFormat;
  final DateTime? startDate;
  final String? tenantId;
  final String? tenantName;
  final double? totalMonth;
  final String? totalMonthFormat;
  final double? totalPaidAmount;
  final double? totalPrice;
  final double? totalPriceExpected;
  final String? totalPriceFormat;
  final String? totalPriceVatFormat;
  final double? totalPriceWithVat;
  final List<InvoicePaymentHistory>? transactionHistories;
  final String? type;
  final String? unitCode;
  final String? unitId;
  final String? unitName;
  final String? unitOfMeasureCode;
  final String? unitOfMeasureName;
  final double? unitPrice;
  final String? unitPriceFormat;
  final double? unitPriceWithVat;
  final double? vat;
  final int? version;

  PeriodTransaction({
    this.adjustDate,
    this.attachedFiles,
    this.branchGlCode,
    this.buildingCode,
    this.buildingId,
    this.buildingName,
    this.buildingServiceCode,
    this.buildingServiceId,
    this.buildingServiceName,
    this.businessCode,
    this.contractId,
    this.contractName,
    this.contractNumber,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.editable,
    this.endDate,
    this.explainAdjust,
    this.files,
    this.floorCode,
    this.floorId,
    this.floorName,
    this.genMode,
    this.glCode,
    this.id,
    this.invoiceId,
    this.invoiceIssuingAddress,
    this.invoiceIssuingEmails,
    this.invoiceNumber,
    this.invoiceRequestNumber,
    this.invoiceRequestStatus,
    this.isPrepaidService,
    this.isSubService,
    this.issuedDate,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.monthlyTransactions,
    this.note,
    this.organizationCode,
    this.organizationId,
    this.organizationMail,
    this.organizationName,
    this.organizationType,
    this.parentBusinessCode,
    this.parentInvoiceIssuingAddress,
    this.parentInvoiceIssuingEmails,
    this.parentOrganizationCode,
    this.parentOrganizationId,
    this.parentOrganizationMail,
    this.parentOrganizationName,
    this.parentOrganizationType,
    this.paymentNotificationId,
    this.paymentNotificationNumber,
    this.paymentNotificationStatus,
    this.paymentStatus,
    this.periodId,
    this.periodTransactionFiles,
    this.provisionalForPeriod,
    this.provisionalStatus,
    this.quantity,
    this.quantityFormat,
    this.startDate,
    this.tenantId,
    this.tenantName,
    this.totalMonth,
    this.totalMonthFormat,
    this.totalPaidAmount,
    this.totalPrice,
    this.totalPriceExpected,
    this.totalPriceFormat,
    this.totalPriceVatFormat,
    this.totalPriceWithVat,
    this.transactionHistories,
    this.type,
    this.unitCode,
    this.unitId,
    this.unitName,
    this.unitOfMeasureCode,
    this.unitOfMeasureName,
    this.unitPrice,
    this.unitPriceFormat,
    this.unitPriceWithVat,
    this.vat,
    this.version,
  });

  factory PeriodTransaction.fromRawJson(String str) => PeriodTransaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PeriodTransaction.fromJson(Map<String, dynamic> json) => PeriodTransaction(
        adjustDate: json["adjustDate"] == null ? null : DateTime.parse(json["adjustDate"]),
        attachedFiles: json["attachedFiles"] == null
            ? []
            : List<AttachedFileElement>.from(
                json["attachedFiles"]!.map((x) => AttachedFileElement.fromJson(x))),
        branchGlCode: json["branchGlCode"],
        buildingCode: json["buildingCode"],
        buildingId: json["buildingId"],
        buildingName: json["buildingName"],
        buildingServiceCode: json["buildingServiceCode"],
        buildingServiceId: json["buildingServiceId"],
        buildingServiceName: json["buildingServiceName"],
        businessCode: json["businessCode"],
        contractId: json["contractId"],
        contractName: json["contractName"],
        contractNumber: json["contractNumber"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        editable: json["editable"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        explainAdjust: json["explainAdjust"],
        files: json["files"] == null
            ? []
            : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
        floorCode: json["floorCode"],
        floorId: json["floorId"],
        floorName: json["floorName"],
        genMode: json["genMode"],
        glCode: json["glCode"],
        id: json["id"],
        invoiceId: json["invoiceId"],
        invoiceIssuingAddress: json["invoiceIssuingAddress"],
        invoiceIssuingEmails: json["invoiceIssuingEmails"],
        invoiceNumber: json["invoiceNumber"],
        invoiceRequestNumber: json["invoiceRequestNumber"],
        invoiceRequestStatus: json["invoiceRequestStatus"],
        isPrepaidService: json["isPrepaidService"],
        isSubService: json["isSubService"],
        issuedDate: json["issuedDate"] == null ? null : DateTime.parse(json["issuedDate"]),
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        monthlyTransactions: json["monthlyTransactions"] == null
            ? []
            : List<MonthlyTransaction>.from(
                json["monthlyTransactions"]!.map((x) => MonthlyTransaction.fromJson(x))),
        note: json["note"],
        organizationCode: json["organizationCode"],
        organizationId: json["organizationId"],
        organizationMail: json["organizationMail"],
        organizationName: json["organizationName"],
        organizationType: json["organizationType"],
        parentBusinessCode: json["parentBusinessCode"],
        parentInvoiceIssuingAddress: json["parentInvoiceIssuingAddress"],
        parentInvoiceIssuingEmails: json["parentInvoiceIssuingEmails"],
        parentOrganizationCode: json["parentOrganizationCode"],
        parentOrganizationId: json["parentOrganizationId"],
        parentOrganizationMail: json["parentOrganizationMail"],
        parentOrganizationName: json["parentOrganizationName"],
        parentOrganizationType: json["parentOrganizationType"],
        paymentNotificationId: json["paymentNotificationId"],
        paymentNotificationNumber: json["paymentNotificationNumber"],
        paymentNotificationStatus: json["paymentNotificationStatus"],
        paymentStatus: json["paymentStatus"],
        periodId: json["periodId"],
        periodTransactionFiles: json["periodTransactionFiles"] == null
            ? []
            : List<AttachedFileElement>.from(
                json["periodTransactionFiles"]!.map((x) => AttachedFileElement.fromJson(x))),
        provisionalForPeriod: json["provisionalForPeriod"] == null
            ? null
            : DateTime.parse(json["provisionalForPeriod"]),
        provisionalStatus: json["provisionalStatus"],
        quantity: json["quantity"],
        quantityFormat: json["quantityFormat"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        tenantId: json["tenantId"],
        tenantName: json["tenantName"],
        totalMonth: json["totalMonth"],
        totalMonthFormat: json["totalMonthFormat"],
        totalPaidAmount: double.tryParse(json["totalPaidAmount"].toString()),
        totalPrice: double.tryParse(json["totalPrice"].toString()),
        totalPriceExpected: double.tryParse(json["totalPriceExpected"].toString()),
        totalPriceFormat: json["totalPriceFormat"],
        totalPriceVatFormat: json["totalPriceVatFormat"],
        totalPriceWithVat: double.tryParse(json["totalPriceWithVat"].toString()),
        transactionHistories: json["transactionHistories"] == null
            ? []
            : List<InvoicePaymentHistory>.from(
                json["transactionHistories"]!.map((x) => InvoicePaymentHistory.fromJson(x))),
        type: json["type"],
        unitCode: json["unitCode"],
        unitId: json["unitId"],
        unitName: json["unitName"],
        unitOfMeasureCode: json["unitOfMeasureCode"],
        unitOfMeasureName: json["unitOfMeasureName"],
        unitPrice: json["unitPrice"],
        unitPriceFormat: json["unitPriceFormat"],
        unitPriceWithVat: json["unitPriceWithVat"],
        vat: json["vat"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "adjustDate":
            "${adjustDate!.year.toString().padLeft(4, '0')}-${adjustDate!.month.toString().padLeft(2, '0')}-${adjustDate!.day.toString().padLeft(2, '0')}",
        "attachedFiles":
            attachedFiles == null ? [] : List<dynamic>.from(attachedFiles!.map((x) => x.toJson())),
        "branchGlCode": branchGlCode,
        "buildingCode": buildingCode,
        "buildingId": buildingId,
        "buildingName": buildingName,
        "buildingServiceCode": buildingServiceCode,
        "buildingServiceId": buildingServiceId,
        "buildingServiceName": buildingServiceName,
        "businessCode": businessCode,
        "contractId": contractId,
        "contractName": contractName,
        "contractNumber": contractNumber,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "editable": editable,
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "explainAdjust": explainAdjust,
        "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
        "floorCode": floorCode,
        "floorId": floorId,
        "floorName": floorName,
        "genMode": genMode,
        "glCode": glCode,
        "id": id,
        "invoiceId": invoiceId,
        "invoiceIssuingAddress": invoiceIssuingAddress,
        "invoiceIssuingEmails": invoiceIssuingEmails,
        "invoiceNumber": invoiceNumber,
        "invoiceRequestNumber": invoiceRequestNumber,
        "invoiceRequestStatus": invoiceRequestStatus,
        "isPrepaidService": isPrepaidService,
        "isSubService": isSubService,
        "issuedDate":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "monthlyTransactions": monthlyTransactions == null
            ? []
            : List<dynamic>.from(monthlyTransactions!.map((x) => x.toJson())),
        "note": note,
        "organizationCode": organizationCode,
        "organizationId": organizationId,
        "organizationMail": organizationMail,
        "organizationName": organizationName,
        "organizationType": organizationType,
        "parentBusinessCode": parentBusinessCode,
        "parentInvoiceIssuingAddress": parentInvoiceIssuingAddress,
        "parentInvoiceIssuingEmails": parentInvoiceIssuingEmails,
        "parentOrganizationCode": parentOrganizationCode,
        "parentOrganizationId": parentOrganizationId,
        "parentOrganizationMail": parentOrganizationMail,
        "parentOrganizationName": parentOrganizationName,
        "parentOrganizationType": parentOrganizationType,
        "paymentNotificationId": paymentNotificationId,
        "paymentNotificationNumber": paymentNotificationNumber,
        "paymentNotificationStatus": paymentNotificationStatus,
        "paymentStatus": paymentStatus,
        "periodId": periodId,
        "periodTransactionFiles": periodTransactionFiles == null
            ? []
            : List<dynamic>.from(periodTransactionFiles!.map((x) => x.toJson())),
        "provisionalForPeriod":
            "${provisionalForPeriod!.year.toString().padLeft(4, '0')}-${provisionalForPeriod!.month.toString().padLeft(2, '0')}-${provisionalForPeriod!.day.toString().padLeft(2, '0')}",
        "provisionalStatus": provisionalStatus,
        "quantity": quantity,
        "quantityFormat": quantityFormat,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "tenantId": tenantId,
        "tenantName": tenantName,
        "totalMonth": totalMonth,
        "totalMonthFormat": totalMonthFormat,
        "totalPaidAmount": totalPaidAmount,
        "totalPrice": totalPrice,
        "totalPriceExpected": totalPriceExpected,
        "totalPriceFormat": totalPriceFormat,
        "totalPriceVatFormat": totalPriceVatFormat,
        "totalPriceWithVat": totalPriceWithVat,
        "transactionHistories": transactionHistories == null
            ? []
            : List<dynamic>.from(transactionHistories!.map((x) => x.toJson())),
        "type": type,
        "unitCode": unitCode,
        "unitId": unitId,
        "unitName": unitName,
        "unitOfMeasureCode": unitOfMeasureCode,
        "unitOfMeasureName": unitOfMeasureName,
        "unitPrice": unitPrice,
        "unitPriceFormat": unitPriceFormat,
        "unitPriceWithVat": unitPriceWithVat,
        "vat": vat,
        "version": version,
      };
}

class AttachedFileElement {
  final String? contractAnnexId;
  final String? contractId;
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? description;
  final String? domainId;
  final String? downloadUrl;
  final String? fileId;
  final String? fileName;
  final String? id;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? type;
  final String? updatedUserId;
  final String? updatedUserName;
  final String? viewUrl;

  AttachedFileElement({
    this.contractAnnexId,
    this.contractId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.description,
    this.domainId,
    this.downloadUrl,
    this.fileId,
    this.fileName,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.type,
    this.updatedUserId,
    this.updatedUserName,
    this.viewUrl,
  });

  factory AttachedFileElement.fromRawJson(String str) =>
      AttachedFileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttachedFileElement.fromJson(Map<String, dynamic> json) => AttachedFileElement(
        contractAnnexId: json["contractAnnexId"],
        contractId: json["contractId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        description: json["description"],
        domainId: json["domainId"],
        downloadUrl: json["downloadUrl"],
        fileId: json["fileId"],
        fileName: json["fileName"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        type: json["type"],
        updatedUserId: json["updatedUserId"],
        updatedUserName: json["updatedUserName"],
        viewUrl: json["viewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "contractAnnexId": contractAnnexId,
        "contractId": contractId,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "description": description,
        "domainId": domainId,
        "downloadUrl": downloadUrl,
        "fileId": fileId,
        "fileName": fileName,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "type": type,
        "updatedUserId": updatedUserId,
        "updatedUserName": updatedUserName,
        "viewUrl": viewUrl,
      };
}

class FileElement {
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? downloadUrl;
  final String? hashed;
  final String? id;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? originalName;
  final String? ownerId;
  final String? ownerType;
  final String? path;
  final int? size;
  final String? type;
  final int? version;
  final String? viewUrl;

  FileElement({
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

  factory FileElement.fromRawJson(String str) => FileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        hashed: json["hashed"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
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

class MonthlyTransaction {
  final String? buildingId;
  final String? buildingName;
  final String? buildingServiceId;
  final String? buildingServiceName;
  final String? contractId;
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final DateTime? endDate;
  final String? floorId;
  final String? floorName;
  final String? glCode;
  final String? id;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final int? monthPeriod;
  final String? note;
  final String? organizationId;
  final String? organizationName;
  final double? originalPrice;
  final double? originalPriceWithVat;
  final String? periodId;
  final String? periodTransactionId;
  final double? quantity;
  final double? quantityUnit;
  final String? sourceId;
  final DateTime? startDate;
  final String? status;
  final double? totalPrice;
  final double? totalPriceWithVat;
  final String? unitId;
  final String? unitName;
  final String? unitOfMeasureCode;
  final String? unitOfMeasureName;
  final double? unitPrice;
  final double? unitPriceWithVat;
  final double? vat;
  final int? version;
  final int? yearPeriod;

  MonthlyTransaction({
    this.buildingId,
    this.buildingName,
    this.buildingServiceId,
    this.buildingServiceName,
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
    this.unitOfMeasureCode,
    this.unitOfMeasureName,
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
        unitOfMeasureCode: json["unitOfMeasureCode"],
        unitOfMeasureName: json["unitOfMeasureName"],
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
        "unitOfMeasureCode": unitOfMeasureCode,
        "unitOfMeasureName": unitOfMeasureName,
        "unitPrice": unitPrice,
        "unitPriceWithVat": unitPriceWithVat,
        "vat": vat,
        "version": version,
        "yearPeriod": yearPeriod,
      };
}

class Page {
  final int? pageIndex;
  final int? pageSize;
  final int? total;

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
