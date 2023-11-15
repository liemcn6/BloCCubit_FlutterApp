import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/repositories/building/building_repo.dart';

class BuildingUseCase {
  final BuildingRepo _repository;

  BuildingUseCase(this._repository);

  Future<List<RowItem>> getBuildingList() async {
    return await _repository.getBuildingList();
  }

  Future<List<RowItem>> getBuildingFloorList(String buildingId) async {
    return await _repository.getBuildingFloorList(buildingId);
  }

  Future<List<RowItem>> getUserBuildingList() async {
    return await _repository.getUserBuildingList();
  }
}
