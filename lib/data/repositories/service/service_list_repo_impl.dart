import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/payment/service_history_response.dart';

import '../../../core/core.dart';
import '../../../domain/entities/service/service_detail.dart';
import '../../../domain/entities/service/service_history.dart';
import '../../../domain/entities/service/service_history_type.dart';
import '../../../domain/entities/service/service_list.dart';
import '../../../domain/repositories/service/service_list_repo.dart';
import '../../data_source/remote/api_endpoints.dart';
import '../../models/response/base_response.dart';
import '../../models/response/service/service_detail_data.dart';
import '../../models/response/service/service_list_response.dart';
import '../../models/response/service/service_type_response.dart';

class ServiceListRepoImpl extends BaseRepository with ServiceListRepo {
  @override
  Future<ServiceList> getServiceList() async {
    ServiceList list = const ServiceList(data: []);
    final res = await Result.guardAsync(() => get(ApiEndpoints.serviceList));

    res.ifSuccess((data) {
      final response = ServiceListResponse.fromJson(data?.data);
      list = ServiceList(
        data: response.data!
            .where((item) => item.status == ServiceDetailStatus.active)
            .map((item) => ServiceListData(
                  id: item.id ?? '',
                  name: item.name ?? '',
                  viewUrl: item.illustrationFile!.viewUrl ?? '',
                ))
            .toList(),
      );
    });
    return list;
  }

  @override
  Future<List<ServiceDetail>> getServiceRecent() async {
    List<ServiceDetail> list = [];
    final res = await Result.guardAsync(() => get(ApiEndpoints.serviceRecent));
    res.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);

      if (res.data != null) {
        for (var e in res.data) {
          final item = ServiceDetailData.fromJson(e);
          if (item.status == ServiceDetailStatus.active) {
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
      }
    });

    return list;
  }

  @override
  Future<ServiceHistory> getServiceHistory(Map<String, dynamic>? queries) async {
    ServiceHistory list = const ServiceHistory(data: []);
    final res = await Result.guardAsync(() => get(ApiEndpoints.serviceHistory, null, queries));
    res.ifSuccess((data) {
      final response = ServiceHistoryResponse.fromJson(data?.data);
      list = ServiceHistory(
          data: response.data!.map((item) {
        ServiceRegistrationStatus status = ServiceRegistrationStatus.approved;
        String itemStatus = item.status ?? '';
        if (item.latestVersion != null) {
          itemStatus = item.latestVersion!.status ?? itemStatus;
        }
        switch (itemStatus) {
          case 'APPROVED':
            status = ServiceRegistrationStatus.approved;
            break;
          case 'WAIT_APPROVE':
            status = ServiceRegistrationStatus.waitApprove;
            break;
          case 'REJECTED':
            status = ServiceRegistrationStatus.rejected;
            break;
          case 'CANCELED':
            status = ServiceRegistrationStatus.canceled;
            break;
          case 'WAIT_CANCEL':
            status = ServiceRegistrationStatus.waitCancel;
            break;
        }

        return ServiceHistoryData(
          id: item.id ?? '',
          facilityName: item.facilityName ?? '',
          registrationDate: item.registrationDate ?? DateTime.now(),
          status: status,
        );
      }).toList());
    });
    return list;
  }

  @override
  Future<ServiceHistoryType> getServiceHistoryType() async {
    ServiceHistoryType list = const ServiceHistoryType(data: []);
    final res = await Result.guardAsync(() => get(ApiEndpoints.serviceType));

    res.ifSuccess((data) {
      final response = ServiceHistoryTypeResponse.fromJson(data?.data);
      list = ServiceHistoryType(
          data: response.data!
              .where((item) => item.status == ServiceDetailStatus.active)
              .map((item) => ServiceHistoryTypeData(
                    id: item.id ?? '',
                    name: item.name ?? '',
                  ))
              .toList());
    });
    return list;
  }
}
