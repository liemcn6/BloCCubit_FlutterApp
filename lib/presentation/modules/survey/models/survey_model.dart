class SurveyModel {
  final String? surveyUserId;
  final String? surveyId;
  final String? name;
  final int? startAt;
  final int? endAt;
  final String? buildingId;
  final String? buildingName;
  final String? organizationId;
  final String? userId;
  final String? status;

  SurveyModel({
    this.surveyUserId,
    this.surveyId,
    this.name,
    this.startAt,
    this.endAt,
    this.buildingId,
    this.buildingName,
    this.organizationId,
    this.userId,
    this.status,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      surveyUserId: json['surveyUserId'],
      surveyId: json['surveyId'],
      name: json['name'],
      startAt: json['startAt'],
      endAt: json['endAt'],
      buildingId: json['buildingId'],
      buildingName: json['buildingName'],
      organizationId: json['organizationId'],
      userId: json['userId'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surveyUserId': surveyUserId,
      'surveyId': surveyId,
      'name': name,
      'startAt': startAt,
      'endAt': endAt,
      'buildingId': buildingId,
      'buildingName': buildingName,
      'organizationId': organizationId,
      'userId': userId,
      'status': status,
    };
  }
}
