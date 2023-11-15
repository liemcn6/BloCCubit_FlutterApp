import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_history_detail_repo.dart';

class VehicleHistoryDetailRepoImpl extends BaseRepository with VehicleHistoryDetailRepo {
  @override
  Future<VehicleHistoryDetail> getVehicleHistoryDetail({required String id}) async {
    VehicleHistoryDetail result = VehicleHistoryDetail();
    final path = StringUtils.replacePathParams(ApiEndpoints.vehicleHistoryDetail, {"id": id});
    final res = await Result.guardAsync(() => get(path));
    res.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      result = VehicleHistoryDetail.fromJson(res.data);
    });

    return result;
  }
}
