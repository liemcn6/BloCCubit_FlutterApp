import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/repositories/survey/survey_repo.dart';
import 'package:home_care/presentation/modules/home/models/building_model.dart';
import 'package:home_care/presentation/modules/survey/models/do_survey_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_details_model.dart';
import 'package:home_care/presentation/modules/survey/models/survey_model.dart';

class SurveyRepoImpl extends BaseRepository with SurveyRepo {
  @override
  //get building
  Future<List<String>> getBuilding() async {
    final List<String> buildingIdList = [];
    final res = await Result.guardAsync(() => get(ApiEndpoints.buildingList));
    if (res.isSuccess) {
      final data = res.data;
      final dataResponse = BaseResponse.fromJson(data?.data);

      // Check data is array
      if (dataResponse.data is List) {
        for (var e in dataResponse.data) {
          final buildingList = BuildingModel.fromJson(e);

          if (buildingList.id != null) {
            buildingIdList.add(buildingList.id ?? "");
          }
        }
      }
    }
    return buildingIdList;
  }

  @override
  Future<SurveyDetailsModel?> requestDetailSurvey(String id, String buildingId) async {
    SurveyDetailsModel data = SurveyDetailsModel();
    final path = StringUtils.replacePathParams(
      ApiEndpoints.detailSurvey,
      {"id": id, "buildingID": buildingId},
    );
    final result = await Result.guardAsync(() => get(path));
    if (result.isSuccess) {
      final res = BaseResponse.fromJson(result.data?.data);

      data = SurveyDetailsModel.fromJson(res.data);
    }
    return data;
  }

  @override
  Future<bool> requestDoSurvey(String id, DoSurveyModel params) async {
    late bool isDone = false;
    final path = StringUtils.replacePathParams(ApiEndpoints.doSurvey, {"id": id});
    final result = await Result.guardAsync(() => post(path, params));

    if (result.isSuccess) {
      isDone = true;
    }
    return isDone;
  }

  @override
  Future<List<SurveyModel>?> requestListSurvey(int pageIndex, int pageSize) async {
    final List<SurveyModel> listData = [];
    final path = StringUtils.replacePathParams(ApiEndpoints.listSurvey,
        {"pageIndex": pageIndex.toString(), "pageSize": pageSize.toString()});
    final result = await Result.guardAsync(() => get(path));
    if (result.isSuccess) {
      final res = BaseResponse.fromJson(result.data?.data);

      if (res.data is List) {
        for (var e in res.data) {
          final item = SurveyModel.fromJson(e);
          listData.add(item);
        }
      }
    }
    return listData;
  }
}
