// To parse this JSON data, do
//
//     final contractDto = contractDtoFromJson(jsonString);

import 'dart:convert';

ContractDto contractDtoFromJson(String str) => ContractDto.fromJson(json.decode(str));

String contractDtoToJson(ContractDto data) => json.encode(data.toJson());

class ContractDto {
  final int? pageIndex;
  final int? pageSize;
  final String? sortBy;

  ContractDto({
    this.pageIndex,
    this.pageSize,
    this.sortBy,
  });

  ContractDto copyWith({
    int? pageIndex,
    int? pageSize,
    String? sortBy,
  }) =>
      ContractDto(
        pageIndex: pageIndex ?? this.pageIndex,
        pageSize: pageSize ?? this.pageSize,
        sortBy: sortBy ?? this.sortBy,
      );

  factory ContractDto.fromJson(Map<String, dynamic> json) => ContractDto(
    pageIndex: json["pageIndex"],
    pageSize: json["pageSize"],
    sortBy: json["sortBy"],
  );

  Map<String, dynamic> toJson() => {
    "pageIndex": pageIndex,
    "pageSize": pageSize,
    "sortBy": sortBy,
  };
}

