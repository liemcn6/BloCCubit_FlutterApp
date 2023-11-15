import 'package:home_care/presentation/modules/survey/models/answer_survey_model.dart';

class DoSurveyModel {
  List<AnswersSurveyModel>? answers;
  String? buildingId;
  String? feedback;

  DoSurveyModel({
    this.answers,
    this.buildingId,
    this.feedback,
  });

  factory DoSurveyModel.fromJson(Map<String, dynamic> json) => DoSurveyModel(
        answers: (json['answers'] as List<dynamic>?)
            ?.map((e) => AnswersSurveyModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        buildingId: json['buildingId'] as String?,
        feedback: json['feedback'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'answers': answers,
        'buildingId': buildingId,
        'feedback': feedback,
      };
}
