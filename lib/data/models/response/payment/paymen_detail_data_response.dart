import 'payment_period_data_response.dart';

class PaymentDetailDataResponse {
  final double? needToPay;
  final double? paidAmount;
  final double? total;
  final List<PaymentPeriodDataResponse>? periodTransactions;

  const PaymentDetailDataResponse({
    this.needToPay,
    this.paidAmount,
    this.total,
    this.periodTransactions,
  });

  factory PaymentDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      PaymentDetailDataResponse(
        needToPay: double.tryParse(json['needToPay'].toString()),
        paidAmount: double.tryParse(json['paidAmount'].toString()),
        total: double.tryParse(json['total'].toString()),
        periodTransactions: List<PaymentPeriodDataResponse>.from(
            json['periodTransactions'].map((x) => PaymentPeriodDataResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'needToPay': needToPay,
        'paidAmount': paidAmount,
        'total': total,
        'periodTransactions': periodTransactions?.map((x) => x.toJson()).toList(),
      };
}
