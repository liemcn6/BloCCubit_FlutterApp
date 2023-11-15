class InvoicePaymentHistoryDataResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? invoiceId;
  final double? amount;
  final String? bankAccountNumber;
  final DateTime? transactionDate;
  final bool? deleted;
  final String? periodTransactionId;
  final String? type;
  final String? bankName;
  final String? note;

  InvoicePaymentHistoryDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.invoiceId,
    this.amount,
    this.bankAccountNumber,
    this.transactionDate,
    this.deleted,
    this.periodTransactionId,
    this.type,
    this.bankName,
    this.note,
  });

  factory InvoicePaymentHistoryDataResponse.fromJson(Map<String, dynamic> json) =>
      InvoicePaymentHistoryDataResponse(
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        id: json["id"],
        invoiceId: json["invoiceId"],
        amount: json["amount"] == null ? null : double.parse(json["amount"].toString()),
        bankAccountNumber: json["bankAccountNumber"],
        transactionDate:
            json["transactionDate"] == null ? null : DateTime.parse(json["transactionDate"]),
        deleted: json["deleted"],
        periodTransactionId: json["periodTransactionId"],
        type: json["type"],
        bankName: json["bankName"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "id": id,
        "invoiceId": invoiceId,
        "amount": amount,
        "bankAccountNumber": bankAccountNumber,
        "transactionDate":
            "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
        "deleted": deleted,
        "periodTransactionId": periodTransactionId,
        "type": type,
        "bankName": bankName,
        "note": note,
      };
}
