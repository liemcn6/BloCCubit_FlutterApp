import 'package:home_care/domain/entities/payment_management/payment_period.dart';

class PaymentDetail {
  final double needToPay;
  final double paidAmount;
  final double total;
  final List<PaymentPeriod> periodTransactions;

  const PaymentDetail({
    this.needToPay = 0,
    this.paidAmount = 0,
    this.total = 0,
    this.periodTransactions = const [],
  });

  PaymentDetail copyWith({
    double? needToPay,
    double? paidAmount,
    double? total,
    List<PaymentPeriod>? periodTransactions,
  }) {
    return PaymentDetail(
      needToPay: needToPay ?? this.needToPay,
      paidAmount: paidAmount ?? this.paidAmount,
      total: total ?? this.total,
      periodTransactions: periodTransactions ?? this.periodTransactions,
    );
  }
}
