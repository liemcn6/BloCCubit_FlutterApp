// To parse this JSON data, do
//
//     final contractModel = contractModelFromJson(jsonString);

import 'dart:convert';

ContractModel contractModelFromJson(String str) => ContractModel.fromJson(json.decode(str));

String contractModelToJson(ContractModel data) => json.encode(data.toJson());

class ContractModel {
  final String? id;
  final String? status;
  final String? contractNumber;
  final String? effectiveDate;
  final String? expirationDate;
  dynamic paidAmount;
  dynamic needPay;

  ContractModel({
    this.id,
    this.status,
    this.contractNumber,
    this.effectiveDate,
    this.expirationDate,
    this.paidAmount,
    this.needPay,
  });

  ContractModel copyWith({
    String? id,
    String? status,
    String? contractNumber,
    String? effectiveDate,
    String? expirationDate,
    dynamic paidAmount,
    dynamic needPay,
  }) =>
      ContractModel(
        id: id ?? this.id,
        status: status ?? this.status,
        contractNumber: contractNumber ?? this.contractNumber,
        effectiveDate: effectiveDate ?? this.effectiveDate,
        expirationDate: expirationDate ?? this.expirationDate,
        paidAmount: paidAmount ?? this.paidAmount,
        needPay: needPay ?? this.needPay,
      );

  factory ContractModel.fromJson(Map<String, dynamic> json) => ContractModel(
    id: json["id"],
    status: json["status"],
    contractNumber: json["contractNumber"],
    effectiveDate: json["effectiveDate"],
    expirationDate: json["expirationDate"],
    paidAmount: json["paidAmount"],
    needPay: json["needPay"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "contractNumber": contractNumber,
    "effectiveDate": effectiveDate,
    "expirationDate": expirationDate,
    "paidAmount": paidAmount,
    "needPay": needPay,
  };
}
