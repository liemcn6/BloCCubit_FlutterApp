import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';

mixin BuildingRepo {
  Future<List<RowItem>> getBuildingList();
  Future<List<RowItem>> getBuildingFloorList(String buildingId);
  Future<List<RowItem>> getUserBuildingList();
}
