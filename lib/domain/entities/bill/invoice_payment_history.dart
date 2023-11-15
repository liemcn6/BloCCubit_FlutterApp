import 'package:flutter/material.dart';

@immutable
class InvoicePaymentHistory {
  final DateTime transactionDate;
  final String bankAccountNumber;
  final String bankName;
  final String note;
  final double amount;

  const InvoicePaymentHistory({
    required this.transactionDate,
    required this.bankAccountNumber,
    required this.bankName,
    required this.note,
    required this.amount,
  });
}
