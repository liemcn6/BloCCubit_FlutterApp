// To parse this JSON data, do
//
//     final ContractDetailModel = ContractDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:home_care/presentation/modules/contract/model/entities/leasing_price_model.dart';
import 'package:home_care/presentation/modules/contract/model/entities/leasing_unit_model.dart';

ContractDetailModel ContractDetailModelFromJson(String str) => ContractDetailModel.fromJson(json.decode(str));

String ContractDetailModelToJson(ContractDetailModel data) => json.encode(data.toJson());

class ContractDetailModel {
  final String? id;
  final String? contractNumber;
  final double? deposit;
  final String? effectiveDate;
  final String? expirationDate;
  final List<LeasingPriceModel>? leasingPrices;
  final List<LeasingUnitModel>? leasingUnits;
  final int? periodPayment;
  final String? viewStatus;

  ContractDetailModel({
    this.id,
    this.contractNumber,
    this.deposit,
    this.effectiveDate,
    this.expirationDate,
    this.leasingPrices,
    this.leasingUnits,
    this.periodPayment,
    this.viewStatus,
  });

  ContractDetailModel copyWith({
    String? id,
    String? contractNumber,
    double? deposit,
    String? effectiveDate,
    String? expirationDate,
    List<LeasingPriceModel>? leasingPrices,
    List<LeasingUnitModel>? leasingUnits,
    int? periodPayment,
    String? viewStatus,
  }) =>
      ContractDetailModel(
        id: id ?? this.id,
        contractNumber: contractNumber ?? this.contractNumber,
        deposit: deposit ?? this.deposit,
        effectiveDate: effectiveDate ?? this.effectiveDate,
        expirationDate: expirationDate ?? this.expirationDate,
        leasingPrices: leasingPrices ?? this.leasingPrices,
        leasingUnits: leasingUnits ?? this.leasingUnits,
        periodPayment: periodPayment ?? this.periodPayment,
        viewStatus: viewStatus ?? this.viewStatus,
      );

  factory ContractDetailModel.fromJson(Map<String, dynamic> json) => ContractDetailModel(
    id: json["id"],
    contractNumber: json["contractNumber"],
    deposit: json["deposit"]?.toDouble(),
    effectiveDate: json["effectiveDate"],
    expirationDate: json["expirationDate"],
    leasingPrices: json["leasingPrices"] == null ? [] : List<LeasingPriceModel>.from(json["leasingPrices"]!.map((x) => LeasingPriceModel.fromJson(x))),
    leasingUnits: json["leasingUnits"] == null ? [] : List<LeasingUnitModel>.from(json["leasingUnits"]!.map((x) => LeasingUnitModel.fromJson(x))),
    periodPayment: json["periodPayment"],
    viewStatus: json["viewStatus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contractNumber": contractNumber,
    "deposit": deposit,
    "effectiveDate": effectiveDate,
    "expirationDate": expirationDate,
    "leasingPrices": leasingPrices == null ? [] : List<dynamic>.from(leasingPrices!.map((x) => x)),
    "leasingUnits": leasingUnits == null ? [] : List<dynamic>.from(leasingUnits!.map((x) => x)),
    "periodPayment": periodPayment,
    "viewStatus": viewStatus,
  };
}

