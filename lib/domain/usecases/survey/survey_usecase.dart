import 'package:home_care/domain/repositories/survey/survey_repo.dart';
import 'package:home_care/presentation/modules/survey/models/do_survey_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_details_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_model.dart';

class SurveyUsecase {
  final SurveyRepo _survey;

  SurveyUsecase(this._survey);

  Future<List<String>> getBuilding() async {
    return await _survey.getBuilding();
  }

  Future<List<SurveyModel>?> requestListSurvey(int pageIndex, int pageSize) async {
    return await _survey.requestListSurvey(pageIndex, pageSize);
  }

  Future<SurveyDetailsModel?> requestDetailSurvey(String id, String buildingId) async {
    return await _survey.requestDetailSurvey(id, buildingId);
  }

  Future<bool> requestDoSurvey(String id, DoSurveyModel params) async {
    return await _survey.requestDoSurvey(id, params);
  }
}
