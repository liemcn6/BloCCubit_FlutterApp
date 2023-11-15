class PaymentItem {
  final String leasingPaymentPeriodId;
  final String startDate;
  final String endDate;
  final String contractId;
  final String contractNumber;
  final double total;
  final double paidAmount;
  final double needToPay;

  PaymentItem({
    required this.leasingPaymentPeriodId,
    required this.startDate,
    required this.endDate,
    required this.contractId,
    required this.contractNumber,
    this.total = 0,
    this.paidAmount = 0,
    this.needToPay = 0,
  });
}
