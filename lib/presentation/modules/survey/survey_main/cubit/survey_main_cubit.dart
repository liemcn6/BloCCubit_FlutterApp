import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/survey/survey_usecase.dart';
import 'package:home_care/presentation/modules/survey/models/survey_model.dart';

part 'survey_main_state.dart';

class SurveyMainCubit extends Cubit<SurveyMainState> {
  SurveyMainCubit() : super(SurveyMainInitial());

  //usecase
  final _usecase = getIt.get<SurveyUsecase>();

  final bool enableLoadMore = false;

  Future<void> requestListSurvey() async {
    Utils.showLoading();
    final result = await _usecase.requestListSurvey(1, 30);
    Utils.hideLoading();
    emit(state.copyWith(listSurvey: result));
  }

  Future onRefresh() async {
    await requestListSurvey();
  }

  Future onLoadMore() async {
    // if (enableLoadMore) {
    //   pageIndex = pageIndex + 1;
    //   await requestListSurvey();
    //   enableLoadMore = false;
    // }
  }
}
