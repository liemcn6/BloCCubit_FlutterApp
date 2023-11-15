// To parse this JSON data, do
//
//     final leasingUnitModel = leasingUnitModelFromJson(jsonString);

import 'dart:convert';

LeasingUnitModel leasingUnitModelFromJson(String str) => LeasingUnitModel.fromJson(json.decode(str));

String leasingUnitModelToJson(LeasingUnitModel data) => json.encode(data.toJson());

class LeasingUnitModel {
  final String? id;
  final String? unitName;
  final double? area;
  final String? floorName;

  LeasingUnitModel({
    this.id,
    this.unitName,
    this.area,
    this.floorName,
  });

  LeasingUnitModel copyWith({
    String? id,
    String? unitName,
    double? area,
    String? floorName,
  }) =>
      LeasingUnitModel(
        id: id ?? this.id,
        unitName: unitName ?? this.unitName,
        area: area ?? this.area,
        floorName: floorName ?? this.floorName,
      );

  factory LeasingUnitModel.fromJson(Map<String, dynamic> json) => LeasingUnitModel(
    id: json["id"],
    unitName: json["unitName"],
    area: json["area"]?.toDouble(),
    floorName: json["floorName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unitName": unitName,
    "area": area,
    "floorName": floorName,
  };
}
