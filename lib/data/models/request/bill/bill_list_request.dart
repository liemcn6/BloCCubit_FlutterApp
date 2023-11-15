import 'dart:convert';

class BillListRequest {
  List<String> buildingIds;
  List<String> paymentStatuses;

  BillListRequest({
    required this.buildingIds,
    required this.paymentStatuses,
  });

  factory BillListRequest.fromRawJson(String str) => BillListRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BillListRequest.fromJson(Map<String, dynamic> json) => BillListRequest(
        buildingIds: List<String>.from(json["buildingIds"].map((x) => x)),
        paymentStatuses: List<String>.from(json["paymentStatuses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "buildingIds": List<dynamic>.from(buildingIds.map((x) => x)),
        "paymentStatuses": List<dynamic>.from(paymentStatuses.map((x) => x)),
      };
}
