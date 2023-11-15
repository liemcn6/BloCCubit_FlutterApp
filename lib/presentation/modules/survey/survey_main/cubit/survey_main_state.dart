part of 'survey_main_cubit.dart';

class SurveyMainState extends Equatable {
  final List<SurveyModel> listSurvey;

  const SurveyMainState({required this.listSurvey});

  @override
  List<Object> get props => [listSurvey];

  SurveyMainState copyWith({List<SurveyModel>? listSurvey}) {
    return SurveyMainState(listSurvey: listSurvey ?? this.listSurvey);
  }
}

final class SurveyMainInitial extends SurveyMainState {
  SurveyMainInitial() : super(listSurvey: []);
}
