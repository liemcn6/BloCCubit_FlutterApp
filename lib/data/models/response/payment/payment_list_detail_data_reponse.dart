import 'package:flutter/foundation.dart';

@immutable
class PaymentListDetailDataResponse {
  final String? leasingPaymentPeriodId;
  final String? startDate;
  final String? endDate;
  final String? contractId;
  final String? contractNumber;
  final double? total;
  final double? paidAmount;
  final double? needToPay;

  const PaymentListDetailDataResponse({
    this.leasingPaymentPeriodId,
    this.startDate,
    this.endDate,
    this.contractId,
    this.contractNumber,
    this.total,
    this.paidAmount,
    this.needToPay,
  });

  factory PaymentListDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      PaymentListDetailDataResponse(
        leasingPaymentPeriodId: json['leasingPaymentPeriodId'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
        contractId: json['contractId'] as String?,
        contractNumber: json['contractNumber'] as String?,
        total: double.tryParse(json['total'].toString()),
        paidAmount: double.tryParse(json['paidAmount'].toString()),
        needToPay: double.tryParse(json['needToPay'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'leasingPaymentPeriodId': leasingPaymentPeriodId,
        'startDate': startDate,
        'endDate': endDate,
        'contractId': contractId,
        'contractNumber': contractNumber,
        'total': total,
        'paidAmount': paidAmount,
        'needToPay': needToPay,
      };
}
