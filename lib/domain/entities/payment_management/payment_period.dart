class PaymentPeriod {
  final String? buildingServiceId;
  final String? buildingServiceName;
  final double quantity;
  final double totalMonth;
  final double totalPrice;
  final String? unit;
  final String? unitCode;
  final String? unitName;
  final String? unitId;
  final dynamic unitPrice;
  final double vat;
  final bool selected;

  PaymentPeriod({
    this.buildingServiceId,
    this.buildingServiceName,
    required this.quantity,
    required this.totalMonth,
    required this.totalPrice,
    this.unit,
    this.unitCode,
    this.unitName,
    this.unitId,
    this.unitPrice,
    required this.vat,
    required this.selected,
  });
}
