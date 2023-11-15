class PaymentStatisticDataResponse {
  final double? totalNeedToPay;

  const PaymentStatisticDataResponse({
    this.totalNeedToPay,
  });

  factory PaymentStatisticDataResponse.fromJson(Map<String, dynamic> json) =>
      PaymentStatisticDataResponse(
        totalNeedToPay: json['totalNeedToPay'] as double?,
      );
}
