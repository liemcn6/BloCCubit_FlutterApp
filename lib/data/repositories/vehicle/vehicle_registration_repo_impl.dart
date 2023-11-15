import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/vehicle/vehicle_registration_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/entities/vehicle/vehicle_history_detail.dart';
import 'package:home_care/data/models/response/vehicle/vehicle_type_data_response.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/repositories/vehicle/vehicle_registration_repo.dart';

class VehicleRegistrationRepoImpl extends BaseRepository with VehicleRegistrationRepo {
  @override
  Future<String?> registerVehicle(VehicleRegistrationRequest data) async {
    String? vehicleRegistrationId;

    final result = await Result.guardAsync(() => post(ApiEndpoints.vehicleRegistration, data));

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      vehicleRegistrationId = res.data['id'];
    });

    return vehicleRegistrationId;
  }

  @override
  Future<bool> updateVehicle(String id, VehicleRegistrationRequest data) async {
    bool isUpdateSuccess = false;
    final path = StringUtils.replacePathParams(ApiEndpoints.vehicleRegistrationUpdate, {'id': id});

    final result = await Result.guardAsync(() => post(path, data));

    result.ifSuccess((data) => isUpdateSuccess = true);

    return isUpdateSuccess;
  }

  @override
  Future<bool> deleteVehicle(String id) async {
    bool isDeleteSuccess = false;

    final path = StringUtils.replacePathParams(ApiEndpoints.vehicleRegistrationDelete, {'id': id});

    final result = await Result.guardAsync(() => post(path, null));

    result.ifSuccess((data) => isDeleteSuccess = true);

    return isDeleteSuccess;
  }

  @override
  Future<List<RowItem>> getVehicleTypes(String id) async {
    final path = StringUtils.replacePathParams(ApiEndpoints.vehicleTypes, {'id': id});
    final result = await Result.guardAsync(() => get(path));

    final List<RowItem> list = [];

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final listData =
          (res.data as List?)?.map((e) => VehicleTypeDataResponse.fromJson(e)).toList() ?? [];

      for (var element in listData) {
        list.add(RowItem(
          id: element.vehicleTypeId,
          name: element.vehicleTypeName,
          code: element.vehicleTypeCode,
        ));
      }
    });

    return list;
  }

  @override
  Future<bool> requestApproval(String id) async {
    bool isSuccess = false;

    final path =
        StringUtils.replacePathParams(ApiEndpoints.vehicleRegistrationRequestApproval, {'id': id});

    final result = await Result.guardAsync(() => post(path, null));

    result.ifSuccess((data) => isSuccess = true);

    return Future.value(isSuccess);
  }

  @override
  Future<bool> vehicleTempleSave(VehicleRegistrationRequest body)async{
    bool result = false;
    final res = await Result.guardAsync(() => post(ApiEndpoints.vehicleHistory,body));
    res.ifSuccess((data) => result = true);
    return result;
  }

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
