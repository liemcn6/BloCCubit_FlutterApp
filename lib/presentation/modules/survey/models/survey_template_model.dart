import 'package:home_care/presentation/modules/survey/models/question_model.dart';

class SurveyTemplateModel {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? name;
  final String? otherOpinion;
  final bool? deleted;
  final List<QuestionsModel>? questions;

  SurveyTemplateModel({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.name,
    this.otherOpinion,
    this.deleted,
    this.questions,
  });

  factory SurveyTemplateModel.fromJson(Map<String, dynamic> json) {
    return SurveyTemplateModel(
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      lastModifiedBy: json['lastModifiedBy'],
      lastModifiedAt: json['lastModifiedAt'],
      id: json['id'],
      name: json['name'],
      otherOpinion: json['otherOpinion'],
      deleted: json['deleted'],
      questions: (json['questions'] as List<dynamic>)
          .map((item) => QuestionsModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'createdAt': createdAt,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedAt': lastModifiedAt,
      'id': id,
      'name': name,
      'otherOpinion': otherOpinion,
      'deleted': deleted,
      'questions': questions?.map((item) => item.toJson()).toList(),
    };
  }
}
