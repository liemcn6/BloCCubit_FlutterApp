class NotificationContentModel {
  final String? buildingId;
  final String? dataId;
  final String? dataType;

  NotificationContentModel({
    this.buildingId,
    this.dataId,
    this.dataType,
  });

  factory NotificationContentModel.fromJson(Map<String, dynamic> json) => NotificationContentModel(
        buildingId: json["buildingId"],
        dataId: json["dataId"],
        dataType: json["dataType"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "dataId": dataId,
        "dataType": dataType,
      };
}
