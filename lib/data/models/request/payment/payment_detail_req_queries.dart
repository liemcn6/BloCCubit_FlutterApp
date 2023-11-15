class PaymentDetailReqQueries {
  List<String>? buildingServiceIds;
  List<String>? unitIds;

  PaymentDetailReqQueries({
    this.buildingServiceIds,
    this.unitIds,
  });

  Map<String, dynamic> toJson() => {
        'buildingServiceIds': buildingServiceIds,
        'unitIds': unitIds,
      };
}
