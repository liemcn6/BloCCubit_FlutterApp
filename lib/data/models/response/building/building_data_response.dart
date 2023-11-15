class BuildingDataResponse {
  final String? id;
  final String? name;
  final String? code;
  final String? status;

  BuildingDataResponse({
    this.id,
    this.name,
    this.code,
    this.status,
  });

  factory BuildingDataResponse.fromJson(Map<String, dynamic> json) => BuildingDataResponse(
        id: json['id'] as String?,
        name: json['name'] as String?,
        code: json['code'] as String?,
        status: json['status'] as String?,
      );
}
