class PaymentPeriodDataResponse {
  final String? buildingServiceId;
  final String? buildingServiceName;
  final double? quantity;
  final double? totalMonth;
  final double? totalPrice;
  final String? unit;
  final String? unitCode;
  final String? unitName;
  final String? unitId;
  final double? unitPrice;
  final double? vat;
  final bool? selected;

  const PaymentPeriodDataResponse({
    this.buildingServiceId,
    this.buildingServiceName,
    this.quantity,
    this.totalMonth,
    this.totalPrice,
    this.unit,
    this.unitCode,
    this.unitName,
    this.unitId,
    this.unitPrice,
    this.vat,
    this.selected,
  });

  factory PaymentPeriodDataResponse.fromJson(Map<String, dynamic> json) =>
      PaymentPeriodDataResponse(
        buildingServiceId: json['buildingServiceId'],
        buildingServiceName: json['buildingServiceName'],
        quantity: double.tryParse(json['quantity'].toString()),
        totalMonth: double.tryParse(json['totalMonth'].toString()),
        totalPrice: double.tryParse(json['totalPrice'].toString()),
        unit: json['unit'],
        unitCode: json['unitCode'],
        unitName: json['unitName'],
        unitId: json['unitId'],
        unitPrice: double.tryParse(json['unitPrice'].toString()),
        vat: double.tryParse(json['vat'].toString()),
        selected: json['selected'],
      );

  Map<String, dynamic> toJson() => {
        'buildingServiceId': buildingServiceId,
        'buildingServiceName': buildingServiceName,
        'quantity': quantity,
        'totalMonth': totalMonth,
        'totalPrice': totalPrice,
        'unit': unit,
        'unitCode': unitCode,
        'unitName': unitName,
        'unitId': unitId,
        'unitPrice': unitPrice,
        'vat': vat,
        'selected': selected,
      };
}
