import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_detail.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_detail_repo.dart';
import 'package:intl/intl.dart';

class VehicleDetailRepoImpl extends BaseRepository with VehicleDetailRepo {
  @override
  Future<VehicleDetail> getVehicleDetail({required String id}) async {
    VehicleDetail result = VehicleDetail();
    final path = StringUtils.replacePathParams(ApiEndpoints.vehicleDetail, {"id": id});
    final res = await Result.guardAsync(() => get(path));
    res.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      result = VehicleDetail.fromJson(res.data);
    });

    return result;
  }

  @override
  Future<bool> postCancelVehicle({required String id}) async {
    bool result = false;

    final date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final body = {
      "chargeType": "DAY",
      "endDate": date,
    };
    final path = StringUtils.replacePathParams(ApiEndpoints.vehicleCancel, {"id": id});
    final res = await Result.guardAsync(() => post(path, body));
    res.ifSuccess((data) {
      result = true;
      // final res = BaseResponse.fromJson(data?.data);
      //result = VehicleDetail.fromJson(res.data);
    });

    return result;
  }
}
