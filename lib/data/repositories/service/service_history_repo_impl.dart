import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/service/service_cancel_req.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/vehicle/service_register_data.dart';
import 'package:home_care/domain/entities/service/service_register_detail.dart';
import 'package:home_care/domain/repositories/service/service_history_repo.dart';

class ServiceHistoryRepoImpl extends BaseRepository with ServiceHistoryRepo {
  @override
  Future<ServiceRegisterDetail> getServiceRegisterDetail({required String id}) async {
    ServiceRegisterDetail response = const ServiceRegisterDetail();
    final path = StringUtils.replacePathParams(ApiEndpoints.serviceBookingId, {"id": id});
    final res = await Result.guardAsync(() => get(path));
    res.ifSuccess((data) {
      final result = BaseResponse.fromJson(data?.data);
      final result0 = ServiceRegisterData.fromJson(result.data);
      response = ServiceRegisterDetail(
          id: result0.id,
          buildingName: result0.buildingName,
          endTime: result0.endTime,
          facilityGroupName: result0.facilityGroupName,
          facilityName: result0.facilityName,
          totalAmount: result0.totalAmount,
          unitName: result0.unitName,
          issuedUserId: result0.issuedUserId,
          status: result0.status,
          latestVersion: ServiceRegisterDetail(
            issuedUserId: result0.latestVersion?.issuedUserId,
          ),
          registrationDate: DateTimeUtils.convertDateInit(result0.registrationDate),
          startTime: result0.startTime,
          histories: result0.histories);
    });

    return response;
  }

  @override
  Future<bool> postServiceCancel({required String id, required String request}) async {
    bool response = false;
    final path = StringUtils.replacePathParams(ApiEndpoints.serviceCancelId, {"id": id});
    final body = ServiceCancelReq(reason: request);
    final res = await Result.guardAsync(() => post(path, body));
    res.ifSuccess((data) {
      final result = BaseResponse.fromJson(data?.data);
      response = result.success ?? true;
    });

    return response;
  }

  @override
  Future<bool> postServiceCancelApproval({required String id, required String request}) async {
    bool response = false;
    final path = StringUtils.replacePathParams(ApiEndpoints.serviceCancelApprovalId, {"id": id});
    final body = ServiceCancelReq(reason: request);
    final res = await Result.guardAsync(() => post(path, body));
    res.ifSuccess((data) {
      final result = BaseResponse.fromJson(data?.data);
      response = result.success ?? true;
    });

    return response;
  }
}
