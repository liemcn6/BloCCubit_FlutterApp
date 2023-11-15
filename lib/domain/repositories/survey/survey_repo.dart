import 'package:home_care/presentation/modules/survey/models/do_survey_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_details_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_model.dart';

mixin SurveyRepo {
  Future<List<String>> getBuilding();

  Future<List<SurveyModel>?> requestListSurvey(int pageIndex, int pageSize);

  Future<SurveyDetailsModel?> requestDetailSurvey(String id, String buildingId);

  Future<bool> requestDoSurvey(String id, DoSurveyModel params);
}
