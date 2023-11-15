class BuildingListRequest {
  List<String>? buildingIds;

  BuildingListRequest({this.buildingIds});

  factory BuildingListRequest.fromJson(Map<String, dynamic> json) => BuildingListRequest(
        buildingIds: json["buildingIds"] == null
            ? []
            : List<String>.from(json["buildingIds"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "buildingIds": buildingIds == null ? [] : List<dynamic>.from(buildingIds!.map((x) => x)),
      };
}
