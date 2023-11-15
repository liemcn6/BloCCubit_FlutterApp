part of 'do_survey_cubit.dart';

class DoSurveyState extends Equatable {
  const DoSurveyState({
    required this.detail,
    required this.answer,
    required this.feedBack,
  });
  final SurveyDetailsModel detail;
  final List<AnswersSurveyModel> answer;
  final TextEditingController feedBack;

  @override
  List<Object> get props => [detail, answer, feedBack];

  DoSurveyState copyWith({
    SurveyDetailsModel? detail,
    List<AnswersSurveyModel>? answer,
    TextEditingController? feedBack,
  }) {
    return DoSurveyState(
      detail: detail ?? this.detail,
      answer: answer ?? this.answer,
      feedBack: feedBack ?? this.feedBack,
    );
  }
}

final class DoSurveyInitial extends DoSurveyState {
  DoSurveyInitial()
      : super(detail: SurveyDetailsModel(), answer: [], feedBack: TextEditingController());
}
