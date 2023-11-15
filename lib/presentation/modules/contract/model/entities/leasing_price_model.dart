// To parse this JSON data, do
//
//     final leasingPriceModel = leasingPriceModelFromJson(jsonString);

import 'dart:convert';

LeasingPriceModel leasingPriceModelFromJson(String str) => LeasingPriceModel.fromJson(json.decode(str));

String leasingPriceModelToJson(LeasingPriceModel data) => json.encode(data.toJson());

class LeasingPriceModel {
  final String? id;
  final String? name;
  final double? unitPrice;
  final String? unitName;
  final String? serviceTypeUnit;

  LeasingPriceModel({
    this.id,
    this.name,
    this.unitPrice,
    this.unitName,
    this.serviceTypeUnit,
  });

  LeasingPriceModel copyWith({
    String? id,
    String? name,
    double? unitPrice,
    String? unitName,
    String? serviceTypeUnit,
  }) =>
      LeasingPriceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        unitPrice: unitPrice ?? this.unitPrice,
        unitName: unitName ?? this.unitName,
        serviceTypeUnit: serviceTypeUnit ?? this.serviceTypeUnit,
      );

  factory LeasingPriceModel.fromJson(Map<String, dynamic> json) => LeasingPriceModel(
    id: json["id"],
    name: json["name"],
    unitPrice: json["unitPrice"]?.toDouble(),
    unitName: json["unitName"],
    serviceTypeUnit: json["serviceTypeUnit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "unitPrice": unitPrice,
    "unitName": unitName,
    "serviceTypeUnit": serviceTypeUnit,
  };
}
