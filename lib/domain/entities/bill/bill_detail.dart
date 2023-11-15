import 'package:flutter/material.dart';
import 'package:home_care/domain/entities/bill/invoice_payment_history.dart';

import 'period_transaction.dart';

@immutable
class BillDetail {
  final double totalAmount;
  final double totalAmountNotVat;
  final double totalPaidAmount;
  final String invoiceNumber;
  final String status;
  final String organizationName;
  final DateTime issueDate;
  final String invoiceIssuingAddress;
  final String note;
  final List<PeriodTransaction> periodTransactions;
  final List<InvoicePaymentHistory> invoicePaymentHistories;

  const BillDetail({
    required this.totalAmount,
    required this.totalAmountNotVat,
    required this.totalPaidAmount,
    required this.invoiceNumber,
    required this.status,
    required this.organizationName,
    required this.issueDate,
    required this.invoiceIssuingAddress,
    required this.note,
    required this.periodTransactions,
    required this.invoicePaymentHistories,
  });

  factory BillDetail.withDefault() => BillDetail(
        totalAmount: 0,
        totalAmountNotVat: 0,
        totalPaidAmount: 0,
        invoiceNumber: '',
        status: '',
        organizationName: '',
        issueDate: DateTime.now(),
        invoiceIssuingAddress: '',
        note: '',
        periodTransactions: const [],
        invoicePaymentHistories: const [],
      );
}
