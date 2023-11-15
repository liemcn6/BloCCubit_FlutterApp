class Floor {
  final int? availableArea;
  final String? buildingId;
  final String? code;
  final int? floorNumber;
  final String? id;
  final String? name;
  final int? totalArea;
  final String? type;

  Floor({
    this.availableArea,
    this.buildingId,
    this.code,
    this.floorNumber,
    this.id,
    this.name,
    this.totalArea,
    this.type,
  });

  factory Floor.fromJson(Map<String, dynamic> json) => Floor(
        availableArea: json["availableArea"],
        buildingId: json["buildingId"],
        code: json["code"],
        floorNumber: json["floorNumber"],
        id: json["id"],
        name: json["name"],
        totalArea: json["totalArea"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "availableArea": availableArea,
        "buildingId": buildingId,
        "code": code,
        "floorNumber": floorNumber,
        "id": id,
        "name": name,
        "totalArea": totalArea,
        "type": type,
      };
}
