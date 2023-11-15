import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/service/service_detail_list_req.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/service/service_detail_data.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';
import 'package:home_care/domain/repositories/service/service_detail_repo.dart';

class ServiceDetailRepoImpl extends BaseRepository with ServiceDetailRepo {
  @override
  Future<List<ServiceDetail>> getServiceDetailList({ServiceDetailListReq? body}) async {
    List<ServiceDetail> list = [];
    final res =
        await Result.guardAsync(() => get(ApiEndpoints.serviceDetailList, null, body?.toMap()));
    res.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);

      if (res.data != null) {
        for (var e in res.data) {
          final item = ServiceDetailData.fromJson(e);
          list.add(ServiceDetail(
            facilityGroupId: item.facilityGroupId,
            terms: item.terms,
            endTime: item.endTime,
            startTime: item.startTime,
            id: item.id,
            name: item.name,
            areaName: item.areaName,
            buildingName: item.buildingName,
            facilityOptions: item.facilityOptions,
            illustrationFile: item.illustrationFile,
            unitName: item.unitName,
          ));
        }
      }
    });

    return list;
  }

  @override
  Future<ServiceDetail> getServiceDetail({required String id}) async {
    ServiceDetail result = ServiceDetail();
    final path = StringUtils.replacePathParams(ApiEndpoints.serviceDetail, {"id": id});
    final res = await Result.guardAsync(() => get(path));
    res.ifSuccess((data) {
      final result0 = BaseResponse.fromJson(data?.data);
      final response = ServiceDetailData.fromJson(result0.data);

      result = ServiceDetail(
        facilityGroupId: response.facilityGroupId,
        terms: response.terms,
        endTime: response.endTime,
        startTime: response.startTime,
        unitName: response.unitName,
        illustrationFile: response.illustrationFile,
        facilityOptions: response.facilityOptions,
        buildingName: response.buildingName,
        areaName: response.areaName,
        name: response.name,
        id: response.id,
      );
    });

    return result;
  }

  @override
  Future<bool> bookingService({required Map<String, dynamic> body}) async {
    bool success = false;

    final result = await Result.guardAsync(() => post(ApiEndpoints.serviceBooking, body));

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      success = res.success ?? false;
    });

    return success;
  }
}
