class MonthlyTransactionDataResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? organizationId;
  final String? contractId;
  final String? periodId;
  final String? buildingId;
  final String? floorId;
  final String? unitId;
  final String? buildingServiceId;
  final String? periodTransactionId;
  final String? sourceId;
  final double? monthPeriod;
  final double? yearPeriod;
  final DateTime? startDate;
  final DateTime? endDate;
  final double? quantity;
  final double? vat;
  final double? unitPrice;
  final double? unitPriceWithVat;
  final double? totalPrice;
  final double? totalPriceWithVat;
  final String? note;
  final double? originalPriceWithVat;
  final double? originalPrice;
  final double? quantityUnit;
  final String? status;
  final bool? deleted;
  final int? version;

  MonthlyTransactionDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.organizationId,
    this.contractId,
    this.periodId,
    this.buildingId,
    this.floorId,
    this.unitId,
    this.buildingServiceId,
    this.periodTransactionId,
    this.sourceId,
    this.monthPeriod,
    this.yearPeriod,
    this.startDate,
    this.endDate,
    this.quantity,
    this.vat,
    this.unitPrice,
    this.unitPriceWithVat,
    this.totalPrice,
    this.totalPriceWithVat,
    this.note,
    this.originalPriceWithVat,
    this.originalPrice,
    this.quantityUnit,
    this.status,
    this.deleted,
    this.version,
  });

  factory MonthlyTransactionDataResponse.fromJson(Map<String, dynamic> json) =>
      MonthlyTransactionDataResponse(
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        id: json["id"],
        organizationId: json["organizationId"],
        contractId: json["contractId"],
        periodId: json["periodId"],
        buildingId: json["buildingId"],
        floorId: json["floorId"],
        unitId: json["unitId"],
        buildingServiceId: json["buildingServiceId"],
        periodTransactionId: json["periodTransactionId"],
        sourceId: json["sourceId"],
        monthPeriod:
            json["monthPeriod"] == null ? null : double.parse(json["monthPeriod"].toString()),
        yearPeriod: json["yearPeriod"] == null ? null : double.parse(json["yearPeriod"].toString()),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        quantity: json["quantity"] == null ? null : double.parse(json["quantity"].toString()),
        vat: json["vat"] == null ? null : double.parse(json["vat"].toString()),
        unitPrice: json["unitPrice"] == null ? null : double.parse(json["unitPrice"].toString()),
        unitPriceWithVat: json["unitPriceWithVat"] == null
            ? null
            : double.parse(json["unitPriceWithVat"].toString()),
        totalPrice: json["totalPrice"] == null ? null : double.parse(json["totalPrice"].toString()),
        totalPriceWithVat: json["totalPriceWithVat"] == null
            ? null
            : double.parse(json["totalPriceWithVat"].toString()),
        note: json["note"],
        originalPriceWithVat: json["originalPriceWithVat"] == null
            ? null
            : double.parse(json["originalPriceWithVat"].toString()),
        originalPrice:
            json["originalPrice"] == null ? null : double.parse(json["originalPrice"].toString()),
        quantityUnit:
            json["quantityUnit"] == null ? null : double.parse(json["quantityUnit"].toString()),
        status: json["status"],
        deleted: json["deleted"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "id": id,
        "organizationId": organizationId,
        "contractId": contractId,
        "periodId": periodId,
        "buildingId": buildingId,
        "floorId": floorId,
        "unitId": unitId,
        "buildingServiceId": buildingServiceId,
        "periodTransactionId": periodTransactionId,
        "sourceId": sourceId,
        "monthPeriod": monthPeriod,
        "yearPeriod": yearPeriod,
        "startDate":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "quantity": quantity,
        "vat": vat,
        "unitPrice": unitPrice,
        "unitPriceWithVat": unitPriceWithVat,
        "totalPrice": totalPrice,
        "totalPriceWithVat": totalPriceWithVat,
        "note": note,
        "originalPriceWithVat": originalPriceWithVat,
        "originalPrice": originalPrice,
        "quantityUnit": quantityUnit,
        "status": status,
        "deleted": deleted,
        "version": version,
      };
}
