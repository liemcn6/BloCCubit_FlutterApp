import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_list_repo.dart';
import 'package:home_care/presentation/modules/vehicle/enum/vehicle_type.dart';

import '../../../core/core.dart';
import '../../../domain/entities/vehicle/vehicle_history.dart';
import '../../../domain/entities/vehicle/vehicle_list.dart';
import '../../data_source/remote/api_endpoints.dart';
import '../../models/response/vehicle/vehicle_history_response.dart';
import '../../models/response/vehicle/vehicle_list_response.dart';

class VehicleListRepoImpl extends BaseRepository with VehicleListRepo {
  @override
  Future<VehicleList> getVehicleList() async {
    VehicleList list = const VehicleList(data: []);
    Map<String, dynamic>? queries = {'month': DateTime.now().month, 'year': DateTime.now().year};
    final res = await Result.guardAsync(() => get(ApiEndpoints.vehicleList, null, queries));

    res.ifSuccess((data) {
      final response = VehicleListResponse.fromJson(data?.data);
      list = VehicleList(
          data: response.data!.map(
        (item) {
          VehicleType type = VehicleType.motor;
          switch (item.vehicleTypeName) {
            case 'Xe đạp':
              type = VehicleType.bike;
              break;
            case 'Xe máy':
              type = VehicleType.motor;
              break;
            case 'Ô tô':
              type = VehicleType.car;
              break;
          }
          VehicleStatus status = VehicleStatus.active;
          switch (item.status) {
            case 'ACTIVE':
              status = VehicleStatus.active;
              break;
            case 'INACTIVE':
              status = VehicleStatus.inactive;
              break;
          }
          return VehicleListData(
            id: item.id ?? '',
            licensePlate: item.licensePlate ?? '',
            type: type,
            registrationDate: item.registrationDate ?? DateTime.now(),
            startDate: item.startDate ?? DateTime.now(),
            endDate: item.endDate ?? DateTime.now(),
            status: status,
            unitPrice: item.unitPrice ?? 0,
          );
        },
      ).toList());
    });
    return list;
  }

  @override
  Future<VehicleHistory> getVehicleHistory() async {
    VehicleHistory list = const VehicleHistory(data: []);
    final res = await Result.guardAsync(() => get(ApiEndpoints.vehicleHistory));

    res.ifSuccess((data) {
      final response = VehicleHistoryResponse.fromJson(data?.data);
      list = VehicleHistory(
          data: response.data!.map((item) {
        int countBike = 0, countMotorbike = 0, countCar = 0;
        for (var i = 0; i < item.registeredVehicleStatistics!.length; i++) {
          var it = item.registeredVehicleStatistics?[i];
          switch (it!.name) {
            case 'Xe đạp':
              countBike = it.total!;
              break;
            case 'Xe máy':
              countMotorbike = it.total!;
              break;
            case 'Ô tô':
              countCar = it.total!;
              break;
          }
        }
        VehicleApprovalStatus status = VehicleApprovalStatus.approved;
        switch (item.approvalStatus) {
          case 'APPROVED':
            status = VehicleApprovalStatus.approved;
            break;
          case 'WAIT_APPROVE':
            status = VehicleApprovalStatus.waitApprove;
            break;
          case 'REJECTED':
            status = VehicleApprovalStatus.rejected;
            break;
          case 'CANCELED':
            status = VehicleApprovalStatus.canceled;
          case 'NEW':
            status = VehicleApprovalStatus.neW;
            break;
        }
        String period = '${item.month}/${item.year}';
        return VehicleHistoryData(
          id: item.id ?? '',
          organizationName: item.organizationName ?? '',
          buildingName: item.buildingName ?? '',
          approvalStatus: status,
          period: period,
          countBike: countBike,
          countMotorbike: countMotorbike,
          countCar: countCar,
        );
      }).toList());
    });
    return list;
  }
}
