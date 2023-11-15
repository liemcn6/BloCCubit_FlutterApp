part of 'survey_details_cubit.dart';

class SurveyDetailsState extends Equatable {
  const SurveyDetailsState({required this.detail});
  final SurveyDetailsModel detail;

  @override
  List<Object> get props => [detail];

  SurveyDetailsState copyWith({SurveyDetailsModel? detail}) {
    return SurveyDetailsState(detail: detail ?? this.detail);
  }
}

final class SurveyDetailsInitial extends SurveyDetailsState {
  SurveyDetailsInitial() : super(detail: SurveyDetailsModel());
}
