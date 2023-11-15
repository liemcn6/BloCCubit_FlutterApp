import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/survey/survey_usecase.dart';
import 'package:home_care/presentation/modules/survey/models/answer_survey_model.dart';
import 'package:home_care/presentation/modules/survey/models/do_survey_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_details_model.dart';
import 'package:home_care/presentation/routes.dart';

part 'do_survey_state.dart';

class DoSurveyCubit extends Cubit<DoSurveyState> {
  DoSurveyCubit() : super(DoSurveyInitial());
  //usecase
  final _usecase = getIt.get<SurveyUsecase>();

  //controller
  late List<AnswersSurveyModel> answerList = [];

  Future<void> requestDetailSurvey(String? id, String? buildingId) async {
    final result = await _usecase.requestDetailSurvey(id ?? "", buildingId ?? "");
    if (result != null) {
      result.surveyTemplate?.questions?.forEach(
        (e) {
          answerList.add(AnswersSurveyModel(questionId: e.id, numberAnswer: 5));
        },
      );
    }
    emit(state.copyWith(detail: result, answer: answerList));
  }

  void setAnswer(
    String? id,
    int? answerNumber,
    String? answerStr,
  ) {
    var questAns = state.answer.asMap().entries.map((e) {
      int index = e.key;
      AnswersSurveyModel value = e.value;
      if (value.questionId == id) {
        AnswersSurveyModel ans = state.answer[index];
        ans = AnswersSurveyModel(
          boolAnswer: true,
          questionId: value.questionId,
          numberAnswer: answerNumber,
          textAnswer: answerStr,
        );
        return ans;
      }

      return state.answer[index];
    }).toList();
    answerList = questAns;
    emit(state.copyWith(answer: questAns));
  }

  Future<void> requestDoSurvey(context, theme) async {
    final t = Utils.languageOf(context);
    //get user building id list
    List<String> buildingIdList = await _usecase.getBuilding();

    final DoSurveyModel params = DoSurveyModel(
      answers: state.answer,
      buildingId: buildingIdList.first,
      feedback: state.feedBack.text,
    );

    final result = await _usecase.requestDoSurvey(state.detail.id ?? "", params);
    if (result) {
      WidgetUtils.showSnackBar(context: context, theme: theme, title: t.surveyDone);
      AppNavigator.pop(true);
      AppNavigator.pop(true);
    }
  }
}
