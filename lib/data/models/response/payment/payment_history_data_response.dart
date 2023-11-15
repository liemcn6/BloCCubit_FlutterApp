class PaymentHistoryDataResponse {
  final String? transactionId;
  final double? paidAmount;
  final String? lastPaymentAt;
  final String? note;

  PaymentHistoryDataResponse({
    this.transactionId,
    this.paidAmount,
    this.lastPaymentAt,
    this.note,
  });

  factory PaymentHistoryDataResponse.fromJson(Map<String, dynamic> json) =>
      PaymentHistoryDataResponse(
        transactionId: json['transactionId'] as String?,
        paidAmount: (json['paidAmount'] as num?)?.toDouble(),
        lastPaymentAt: json['lastPaymentAt'] as String?,
        note: json['note'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'transactionId': transactionId,
        'paidAmount': paidAmount,
        'lastPaymentAt': lastPaymentAt,
        'note': note,
      };
}
