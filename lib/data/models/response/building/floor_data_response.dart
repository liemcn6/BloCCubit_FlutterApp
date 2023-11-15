// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class FloorDataResponse {
  final String? id;
  final String? name;
  final String? buildingId;
  final int? floorNumber;
  final String? code;
  final double? totalArea;
  final double? availableArea;
  final String? type;

  FloorDataResponse({
    this.id,
    this.name,
    this.buildingId,
    this.floorNumber,
    this.code,
    this.totalArea,
    this.availableArea,
    this.type,
  });

  factory FloorDataResponse.fromJson(Map<String, dynamic> json) => FloorDataResponse(
        id: json["id"],
        name: json["name"],
        buildingId: json["buildingId"],
        floorNumber: json["floorNumber"],
        code: json["code"],
        totalArea: json["totalArea"],
        availableArea: json["availableArea"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "buildingId": buildingId,
        "floorNumber": floorNumber,
        "code": code,
        "totalArea": totalArea,
        "availableArea": availableArea,
        "type": type,
      };
}
