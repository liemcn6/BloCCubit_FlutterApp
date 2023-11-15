import 'package:home_care/presentation/modules/survey/models/survey_template_model.dart';

class SurveyDetailsModel {
  final String? id;
  final String? name;
  final String? status;
  final String? surveyUserStatus;
  final String? introduction;
  final String? notificationContent;
  final int? startAt;
  final int? endAt;
  final String? note;
  final bool? deleted;
  final String? buildingId;
  final SurveyTemplateModel? surveyTemplate;
  final String? surveyTemplateId;

  SurveyDetailsModel({
    this.id,
    this.name,
    this.status,
    this.surveyUserStatus,
    this.introduction,
    this.notificationContent,
    this.startAt,
    this.endAt,
    this.note,
    this.deleted,
    this.buildingId,
    this.surveyTemplate,
    this.surveyTemplateId,
  });

  factory SurveyDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurveyDetailsModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      surveyUserStatus: json['surveyUserStatus'],
      introduction: json['introduction'],
      notificationContent: json['notificationContent'],
      startAt: json['startAt'],
      endAt: json['endAt'],
      note: json['note'],
      deleted: json['deleted'],
      buildingId: json['buildingId'],
      surveyTemplate: SurveyTemplateModel.fromJson(json['surveyTemplate']),
      surveyTemplateId: json['surveyTemplateId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'surveyUserStatus': surveyUserStatus,
      'introduction': introduction,
      'notificationContent': notificationContent,
      'startAt': startAt,
      'endAt': endAt,
      'note': note,
      'deleted': deleted,
      'buildingId': buildingId,
      'surveyTemplate': surveyTemplate?.toJson(),
      'surveyTemplateId': surveyTemplateId,
    };
  }
}
