import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/usecases/survey/survey_usecase.dart';
import 'package:home_care/presentation/modules/survey/models/survey_details_model.dart';
import 'package:html/parser.dart';

part 'survey_details_state.dart';

class SurveyDetailsCubit extends Cubit<SurveyDetailsState> {
  SurveyDetailsCubit() : super(SurveyDetailsInitial());

  //usecase
  final _usecase = getIt.get<SurveyUsecase>();

  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text).documentElement!.text;
    return parsedString;
  }

  Future<void> requestDetailSurvey(String? id, String? buildingId, context) async {
    final result = await _usecase.requestDetailSurvey(id ?? "", buildingId ?? "");
    emit(state.copyWith(detail: result));
  }
}
