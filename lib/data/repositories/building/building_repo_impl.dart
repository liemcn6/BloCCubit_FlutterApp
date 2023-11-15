import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/building/building_data_response.dart';
import 'package:home_care/data/models/response/building/floor_data_response.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/repositories/building/building_repo.dart';

class BuildingRepoImpl extends BaseRepository with BuildingRepo {
  @override
  Future<List<RowItem>> getBuildingList() async {
    final buildingList = <RowItem>[];
    final result = await Result.guardAsync(() => get(ApiEndpoints.buildingList));

    result.ifSuccess((data) {
      final baseResponse = BaseResponse.fromJson(data?.data);

      if (baseResponse.data != null) {
        for (var e in baseResponse.data) {
          final building = BuildingDataResponse.fromJson(e);

          buildingList.add(RowItem(
            id: building.id,
            name: building.name,
            code: building.code,
          ));
        }
      }
    });

    return buildingList;
  }

  @override
  Future<List<RowItem>> getBuildingFloorList(String buildingId) async {
    final List<RowItem> floorList = [];
    final result = await Result.guardAsync(
      () => get(
        StringUtils.replacePathParams(ApiEndpoints.floorList, {'id': buildingId}),
      ),
    );

    result.ifSuccess((data) {
      final baseResponse = BaseResponse.fromJson(data?.data);

      if (baseResponse.data != null) {
        for (var e in baseResponse.data) {
          final floor = FloorDataResponse.fromJson(e);

          floorList.add(RowItem(
            id: floor.id,
            name: floor.name,
            code: floor.code,
          ));
        }
      }
    });

    return floorList;
  }

  @override
  Future<List<RowItem>> getUserBuildingList() async {
    final buildingList = <RowItem>[];
    final result = await Result.guardAsync(() => get(ApiEndpoints.buildingList));

    result.ifSuccess((data) {
      final baseResponse = BaseResponse.fromJson(data?.data);

      if (baseResponse.data != null) {
        for (var e in baseResponse.data) {
          final building = BuildingDataResponse.fromJson(e);

          buildingList.add(RowItem(
            id: building.id,
            name: building.name,
            code: building.code,
          ));
        }
      }
    });

    return buildingList;
  }
}
