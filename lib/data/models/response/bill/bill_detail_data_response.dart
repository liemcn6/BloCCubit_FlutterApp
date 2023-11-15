import 'invoice_payment_history_data_response.dart';
import 'period_transaction_data_response.dart';

class BillDetailDataResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? invoiceNumber;
  final String? invoiceRequestNumber;
  final String? buildingId;
  final String? tenantId;
  final String? buildingServiceId;
  final String? glCode;
  final String? organizationId;
  final String? organizationType;
  final int? yearPeriod;
  final double? totalAmount;
  final double? totalAmountNotVat;
  final double? totalAmountExpected;
  final double? totalPaidAmount;
  final DateTime? issuedDate;
  final String? note;
  final String? status;
  final bool? deleted;
  final int? version;
  final String? explainAdjust;
  final List<PeriodTransactionDataResponse>? periodTransactions;
  final List<InvoicePaymentHistoryDataResponse>? paymentTransactions;
  final List<InvoicePaymentHistoryDataResponse>? invoicePaymentHistories;
  final String? tenantName;
  final String? buildingCode;
  final String? buildingName;
  final String? organizationName;
  final String? organizationCode;
  final String? invoiceIssuingAddress;

  BillDetailDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.invoiceNumber,
    this.invoiceRequestNumber,
    this.buildingId,
    this.tenantId,
    this.buildingServiceId,
    this.glCode,
    this.organizationId,
    this.organizationType,
    this.yearPeriod,
    this.totalAmount,
    this.totalAmountNotVat,
    this.totalAmountExpected,
    this.totalPaidAmount,
    this.issuedDate,
    this.note,
    this.status,
    this.deleted,
    this.version,
    this.explainAdjust,
    this.periodTransactions,
    this.paymentTransactions,
    this.invoicePaymentHistories,
    this.tenantName,
    this.buildingCode,
    this.buildingName,
    this.organizationName,
    this.organizationCode,
    this.invoiceIssuingAddress,
  });

  factory BillDetailDataResponse.fromJson(Map<String, dynamic> json) => BillDetailDataResponse(
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        id: json["id"],
        invoiceNumber: json["invoiceNumber"],
        invoiceRequestNumber: json["invoiceRequestNumber"],
        buildingId: json["buildingId"],
        tenantId: json["tenantId"],
        buildingServiceId: json["buildingServiceId"],
        glCode: json["glCode"],
        organizationId: json["organizationId"],
        organizationType: json["organizationType"],
        yearPeriod: json["yearPeriod"],
        totalAmount:
            json["totalAmount"] == null ? null : double.tryParse(json["totalAmount"].toString()),
        totalAmountNotVat: json["totalAmountNotVat"] == null
            ? null
            : double.tryParse(json["totalAmountNotVat"].toString()),
        totalAmountExpected: json["totalAmountExpected"] == null
            ? null
            : double.tryParse(json["totalAmountExpected"].toString()),
        totalPaidAmount: json["totalPaidAmount"] == null
            ? null
            : double.tryParse(json["totalPaidAmount"].toString()),
        issuedDate: json["issuedDate"] == null ? null : DateTime.parse(json["issuedDate"]),
        note: json["note"],
        status: json["status"],
        deleted: json["deleted"],
        version: json["version"],
        explainAdjust: json["explainAdjust"],
        periodTransactions: json["periodTransactions"] == null
            ? []
            : List<PeriodTransactionDataResponse>.from(
                json["periodTransactions"]!.map((x) => PeriodTransactionDataResponse.fromJson(x))),
        paymentTransactions: json["paymentTransactions"] == null
            ? []
            : List<InvoicePaymentHistoryDataResponse>.from(json["paymentTransactions"]!
                .map((x) => InvoicePaymentHistoryDataResponse.fromJson(x))),
        invoicePaymentHistories: json["invoicePaymentHistories"] == null
            ? []
            : List<InvoicePaymentHistoryDataResponse>.from(json["invoicePaymentHistories"]!
                .map((x) => InvoicePaymentHistoryDataResponse.fromJson(x))),
        tenantName: json["tenantName"],
        buildingCode: json["buildingCode"],
        buildingName: json["buildingName"],
        organizationName: json["organizationName"],
        organizationCode: json["organizationCode"],
        invoiceIssuingAddress: json["invoiceIssuingAddress"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "id": id,
        "invoiceNumber": invoiceNumber,
        "invoiceRequestNumber": invoiceRequestNumber,
        "buildingId": buildingId,
        "tenantId": tenantId,
        "buildingServiceId": buildingServiceId,
        "glCode": glCode,
        "organizationId": organizationId,
        "organizationType": organizationType,
        "yearPeriod": yearPeriod,
        "totalAmount": totalAmount,
        "totalAmountNotVat": totalAmountNotVat,
        "totalAmountExpected": totalAmountExpected,
        "totalPaidAmount": totalPaidAmount,
        "issuedDate":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "note": note,
        "status": status,
        "deleted": deleted,
        "version": version,
        "explainAdjust": explainAdjust,
        "periodTransactions": periodTransactions == null
            ? []
            : List<dynamic>.from(periodTransactions!.map((x) => x.toJson())),
        "paymentTransactions": paymentTransactions == null
            ? []
            : List<dynamic>.from(paymentTransactions!.map((x) => x.toJson())),
        "invoicePaymentHistories": invoicePaymentHistories == null
            ? []
            : List<dynamic>.from(invoicePaymentHistories!.map((x) => x.toJson())),
        "tenantName": tenantName,
        "buildingCode": buildingCode,
        "buildingName": buildingName,
        "organizationName": organizationName,
        "organizationCode": organizationCode,
        "invoiceIssuingAddress": invoiceIssuingAddress,
      };
}
