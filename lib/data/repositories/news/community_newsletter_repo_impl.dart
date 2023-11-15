import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/building/building_list_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/repositories/news/community_newsletter_repo.dart';
import 'package:home_care/presentation/modules/home/models/building_model.dart';
import 'package:home_care/presentation/modules/home/models/lastest_news_model.dart';
import 'package:home_care/presentation/modules/home/models/news_model.dart';

class CommunityNewsletterRepoImpl extends BaseRepository with CommunityNewsletterRepo {
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
  Future<List<String>> getCategory(List<String> buildingIdList) async {
    List<String> categoryTempList = [];
    List<String> categoryList = [];
    BuildingListRequest params = BuildingListRequest(buildingIds: buildingIdList);

    final res = await Result.guardAsync(() => get(
          ApiEndpoints.searchNews, null, // Removed the unnecessary null in the list of parameters
          {'buildingIds': params.buildingIds},
        ));

    res.ifSuccess((data) {
      final data = res.data;

      final dataReponse = BaseResponse.fromJson(data?.data);

      for (var e in dataReponse.data) {
        if (e is Map<String, dynamic> && e.containsKey('status')) {
          var item = NewsModel.fromJson(e);
          if (e["status"] == NewsStatusEnum.active &&
              item.approvalStatus == NewsApprovalStatusEnum.approvedStatus) {
            categoryTempList.add(item.catalogName ?? "");
          }
        }
      }

      categoryList = categoryTempList.toSet().toList();
    });
    return categoryList;
  }

  @override
  Future<List<NewsModel>> searchNews(List<String> buildingIdList) async {
    List<NewsModel> listData = [];
    BuildingListRequest params = BuildingListRequest(buildingIds: buildingIdList);
    final res = await Result.guardAsync(() => get(
          ApiEndpoints.searchNews, null, // Removed the unnecessary null in the list of parameters
          {'buildingIds': params.buildingIds},
        ));

    res.ifSuccess((data) {
      final dataResponse = BaseResponse.fromJson(data?.data);

      if (dataResponse.data is List) {
        for (var e in dataResponse.data) {
          if (e is Map<String, dynamic> && e.containsKey('status')) {
            var item = NewsModel.fromJson(e);
            if (e['status'] == NewsStatusEnum.active &&
                item.approvalStatus == NewsApprovalStatusEnum.approvedStatus) {
              listData.add(item);
            }
          }
        }
      }
    });
    return listData;
  }

  @override
  Future<LastestNewsModel> searchNewDetails(String id) async {
    LastestNewsModel newsContent = LastestNewsModel();
    final res = await Result.guardAsync(() => get(ApiEndpoints.searchNewsDetails(id)));
    if (res.isSuccess) {
      final data = res.data;
      final dataResponse = BaseResponse.fromJson(data?.data);
      newsContent = LastestNewsModel.fromJson(dataResponse.data);
      // Check data is array
      if (dataResponse.data is List) {
        for (var e in dataResponse.data) {
          newsContent = LastestNewsModel.fromJson(e);
        }
      }
    }
    return newsContent;
  }

  @override
  Future<List<NewsModel>> searchNewsMostViewed() async {
    List<NewsModel> listData = [];
    List<String> categoryTempList = [];

    String selectedCategory = "";
    final res = await Result.guardAsync(() => get(ApiEndpoints.searchNewsMostViewed));

    res.ifSuccess((data) {
      final data = res.data;

      final dataReponse = BaseResponse.fromJson(data?.data);

      for (var e in dataReponse.data) {
        var item = NewsModel.fromJson(e);
        if (
            // e.status == NewsStatusEnum.active &&
            item.approvalStatus == NewsApprovalStatusEnum.approvedStatus) {
          categoryTempList.add(item.catalogName ?? "");
          if (selectedCategory == "") {
            selectedCategory = categoryTempList.first;
          }
          if (item.catalogName == selectedCategory) {
            listData.add(item);
          }
        }
      }
    });
    return listData;
  }
}

class NewsStatusEnum {
  static const active = "ACTIVE";
  static const inactive = "INACTIVE";
}

class NewsApprovalStatusEnum {
  static const newStatus = "NEW"; // Tạo mới

  static const approvedStatus = "APPROVED"; // Đã duyệt

  static const waitAprroveStatus = "WAIT_APPROVE"; // Chờ duyệt

  static const rejectedStatus = "REJECTED"; // Từ chối

  static const canceledStatus = "CANCELED"; // Hủy
}
