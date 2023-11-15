import 'package:flutter/material.dart';

@immutable
class PeriodTransaction {
  final String buildingServiceName;
  final String note;
  final double unitPriceWithVat;
  final double quantity;
  final double totalPriceWithVat;
  final String id;
  final double totalMonth;
  final String unitOfMeasureName;
  final double totalPaidAmount;

  const PeriodTransaction({
    required this.buildingServiceName,
    required this.note,
    required this.unitPriceWithVat,
    required this.quantity,
    required this.totalPriceWithVat,
    required this.id,
    required this.totalMonth,
    required this.unitOfMeasureName,
    required this.totalPaidAmount,
  });
}
