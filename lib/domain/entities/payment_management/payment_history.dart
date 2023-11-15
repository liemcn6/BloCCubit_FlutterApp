class PaymentHistory {
  String? transactionId;
  double paidAmount;
  String? lastPaymentAt;
  String? note;

  PaymentHistory({
    this.transactionId,
    this.paidAmount = 0,
    this.lastPaymentAt,
    this.note,
  });
}
