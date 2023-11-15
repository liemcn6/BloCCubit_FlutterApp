class ServiceTypeQueries {
  final List<String> buildingIds;
  final List<String> facilityGroupIds;
  final List<String>? statuses;

  ServiceTypeQueries({
    required this.buildingIds,
    required this.facilityGroupIds,
    this.statuses = const ['ACTIVE'],
  });

  factory ServiceTypeQueries.fromJson(Map<String, dynamic> json) => ServiceTypeQueries(
        buildingIds: List<String>.from(json["buildingIds"].map((x) => x)),
        facilityGroupIds: List<String>.from(json["facilityGroupIds"].map((x) => x)),
        statuses: List<String>.from(json["statuses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "buildingIds": List<dynamic>.from(buildingIds.map((x) => x)),
        "facilityGroupIds": List<dynamic>.from(facilityGroupIds.map((x) => x)),
        "statuses": List<dynamic>.from(statuses!.map((x) => x)),
      };
}
