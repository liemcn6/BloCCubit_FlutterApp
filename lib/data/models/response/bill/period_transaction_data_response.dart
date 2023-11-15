import 'invoice_payment_history_data_response.dart';
import 'monthly_transaction_data_response.dart';

class PeriodTransactionDataResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? contractId;
  final String? organizationId;
  final String? periodId;
  final String? buildingId;
  final String? tenantId;
  final String? floorId;
  final String? unitId;
  final String? buildingServiceId;
  final String? glCode;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? totalMonth;
  final double? quantity;
  final double? vat;
  final double? unitPrice;
  final double? unitPriceWithVat;
  final double? totalPrice;
  final double? totalPriceWithVat;
  final double? totalPriceExpected;
  final String? paymentStatus;
  final DateTime? issuedDate;
  final String? note;
  final String? type;
  final String? genMode;
  final String? provisionalStatus;
  final String? paymentNotificationId;
  final String? paymentNotificationStatus;
  final String? invoiceId;
  final String? invoiceNumber;
  final String? invoiceRequestStatus;
  final String? invoiceRequestNumber;
  final bool? deleted;
  final int? version;
  final List<MonthlyTransactionDataResponse>? monthlyTransactions;
  final List<InvoicePaymentHistoryDataResponse>? transactionHistories;
  final List<dynamic>? periodTransactionFiles;
  final String? invoiceIssuingEmails;
  final String? buildingServiceCode;
  final String? unitOfMeasureName;
  final String? unitOfMeasureCode;
  final String? buildingServiceName;
  final bool? isPrepaidService;
  final bool? isSubService;
  final double? totalPaidAmount;

  PeriodTransactionDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.contractId,
    this.organizationId,
    this.periodId,
    this.buildingId,
    this.tenantId,
    this.floorId,
    this.unitId,
    this.buildingServiceId,
    this.glCode,
    this.startDate,
    this.endDate,
    this.totalMonth,
    this.quantity,
    this.vat,
    this.unitPrice,
    this.unitPriceWithVat,
    this.totalPrice,
    this.totalPriceWithVat,
    this.totalPriceExpected,
    this.paymentStatus,
    this.issuedDate,
    this.note,
    this.type,
    this.genMode,
    this.provisionalStatus,
    this.paymentNotificationId,
    this.paymentNotificationStatus,
    this.invoiceId,
    this.invoiceNumber,
    this.invoiceRequestStatus,
    this.invoiceRequestNumber,
    this.deleted,
    this.version,
    this.monthlyTransactions,
    this.transactionHistories,
    this.periodTransactionFiles,
    this.invoiceIssuingEmails,
    this.buildingServiceCode,
    this.unitOfMeasureName,
    this.unitOfMeasureCode,
    this.buildingServiceName,
    this.isPrepaidService,
    this.isSubService,
    this.totalPaidAmount,
  });

  factory PeriodTransactionDataResponse.fromJson(Map<String, dynamic> json) =>
      PeriodTransactionDataResponse(
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        id: json["id"],
        contractId: json["contractId"],
        organizationId: json["organizationId"],
        periodId: json["periodId"],
        buildingId: json["buildingId"],
        tenantId: json["tenantId"],
        floorId: json["floorId"],
        unitId: json["unitId"],
        buildingServiceId: json["buildingServiceId"],
        glCode: json["glCode"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        totalMonth: json["totalMonth"] == null ? null : double.parse(json["totalMonth"].toString()),
        quantity: json["quantity"] == null ? null : double.parse(json["quantity"].toString()),
        vat: json["vat"] == null ? null : double.parse(json["vat"].toString()),
        unitPrice: json["unitPrice"] == null ? null : double.parse(json["unitPrice"].toString()),
        unitPriceWithVat: json["unitPriceWithVat"] == null
            ? null
            : double.parse(json["unitPriceWithVat"].toString()),
        totalPrice: json["totalPrice"] == null ? null : double.parse(json["totalPrice"].toString()),
        totalPriceWithVat: json["totalPriceWithVat"] == null
            ? null
            : double.parse(json["totalPriceWithVat"].toString()),
        totalPriceExpected: json["totalPriceExpected"] == null
            ? null
            : double.parse(json["totalPriceExpected"].toString()),
        paymentStatus: json["paymentStatus"],
        issuedDate: json["issuedDate"] == null ? null : DateTime.parse(json["issuedDate"]),
        note: json["note"],
        type: json["type"],
        genMode: json["genMode"],
        provisionalStatus: json["provisionalStatus"],
        paymentNotificationId: json["paymentNotificationId"],
        paymentNotificationStatus: json["paymentNotificationStatus"],
        invoiceId: json["invoiceId"],
        invoiceNumber: json["invoiceNumber"],
        invoiceRequestStatus: json["invoiceRequestStatus"],
        invoiceRequestNumber: json["invoiceRequestNumber"],
        deleted: json["deleted"],
        version: json["version"],
        monthlyTransactions: json["monthlyTransactions"] == null
            ? []
            : List<MonthlyTransactionDataResponse>.from(
                json["monthlyTransactions"].map((x) => MonthlyTransactionDataResponse.fromJson(x))),
        transactionHistories: json["transactionHistories"] == null
            ? []
            : List<InvoicePaymentHistoryDataResponse>.from(json["transactionHistories"]
                .map((x) => InvoicePaymentHistoryDataResponse.fromJson(x))),
        periodTransactionFiles: json["periodTransactionFiles"] == null
            ? []
            : List<dynamic>.from(json["periodTransactionFiles"].map((x) => x)),
        invoiceIssuingEmails: json["invoiceIssuingEmails"],
        buildingServiceCode: json["buildingServiceCode"],
        unitOfMeasureName: json["unitOfMeasureName"],
        unitOfMeasureCode: json["unitOfMeasureCode"],
        buildingServiceName: json["buildingServiceName"],
        isPrepaidService: json["isPrepaidService"],
        isSubService: json["isSubService"],
        totalPaidAmount: json["totalPaidAmount"] == null
            ? null
            : double.parse(json["totalPaidAmount"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "id": id,
        "contractId": contractId,
        "organizationId": organizationId,
        "periodId": periodId,
        "buildingId": buildingId,
        "tenantId": tenantId,
        "floorId": floorId,
        "unitId": unitId,
        "buildingServiceId": buildingServiceId,
        "glCode": glCode,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "totalMonth": totalMonth,
        "quantity": quantity,
        "vat": vat,
        "unitPrice": unitPrice,
        "unitPriceWithVat": unitPriceWithVat,
        "totalPrice": totalPrice,
        "totalPriceWithVat": totalPriceWithVat,
        "totalPriceExpected": totalPriceExpected,
        "paymentStatus": paymentStatus,
        "issuedDate":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "note": note,
        "type": type,
        "genMode": genMode,
        "provisionalStatus": provisionalStatus,
        "paymentNotificationId": paymentNotificationId,
        "paymentNotificationStatus": paymentNotificationStatus,
        "invoiceId": invoiceId,
        "invoiceNumber": invoiceNumber,
        "invoiceRequestStatus": invoiceRequestStatus,
        "invoiceRequestNumber": invoiceRequestNumber,
        "deleted": deleted,
        "version": version,
        "monthlyTransactions": monthlyTransactions == null
            ? []
            : List<dynamic>.from(monthlyTransactions!.map((x) => x.toJson())),
        "transactionHistories": transactionHistories == null
            ? []
            : List<dynamic>.from(transactionHistories!.map((x) => x.toJson())),
        "periodTransactionFiles": periodTransactionFiles == null
            ? []
            : List<dynamic>.from(periodTransactionFiles!.map((x) => x)),
        "invoiceIssuingEmails": invoiceIssuingEmails,
        "buildingServiceCode": buildingServiceCode,
        "unitOfMeasureName": unitOfMeasureName,
        "unitOfMeasureCode": unitOfMeasureCode,
        "buildingServiceName": buildingServiceName,
        "isPrepaidService": isPrepaidService,
        "isSubService": isSubService,
        "totalPaidAmount": totalPaidAmount,
      };
}
