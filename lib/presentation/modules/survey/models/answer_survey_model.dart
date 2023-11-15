class AnswersSurveyModel {
  bool? boolAnswer;
  int? numberAnswer;
  String? questionId;
  String? textAnswer;

  AnswersSurveyModel({
    this.boolAnswer,
    this.numberAnswer,
    this.questionId,
    this.textAnswer,
  });

  factory AnswersSurveyModel.fromJson(Map<String, dynamic> json) => AnswersSurveyModel(
        boolAnswer: json['boolAnswer'] as bool?,
        numberAnswer: json['numberAnswer'] as int?,
        questionId: json['questionId'] as String?,
        textAnswer: json['textAnswer'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'boolAnswer': boolAnswer,
        'numberAnswer': numberAnswer,
        'questionId': questionId,
        'textAnswer': textAnswer,
      };
}
