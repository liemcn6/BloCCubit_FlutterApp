import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/service/service_location_queries.dart';
import 'package:home_care/data/models/request/service/service_registration_body.dart';
import 'package:home_care/data/models/request/service/service_type_queries.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/service/service_group_data.dart';
import 'package:home_care/data/models/response/service/service_location_data.dart';
import 'package:home_care/data/models/response/service/service_time_frame_data.dart';
import 'package:home_care/data/models/response/service/service_type_data.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/service/service_location.dart';
import 'package:home_care/domain/repositories/service/service_registration_repo.dart';

class ServiceRegistrationRepoImpl extends BaseRepository with ServiceRegistrationRepo {
  @override
  Future<List<RowItem>> getServiceGroupList() async {
    final List<RowItem> rt = [];
    final queries = {
      'statuses': ['ACTIVE']
    };

    final result = await Result.guardAsync(
      () => get(ApiEndpoints.serviceGroup, null, queries),
    );

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final list = res.data?.map((e) => ServiceGroupData.fromJson(e)).toList() ?? [];

      for (var element in list) {
        rt.add(RowItem(
          id: element.id,
          name: element.name,
        ));
      }
    });

    return rt;
  }

  @override
  Future<List<RowItem>> getServiceTypeList(ServiceTypeQueries queries) async {
    final List<RowItem> rt = [];

    final result = await Result.guardAsync(
      () => get(ApiEndpoints.serviceType, null, queries.toJson()),
    );

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final list = res.data?.map((e) => ServiceTypeData.fromJson(e)).toList() ?? [];

      for (var element in list) {
        rt.add(RowItem(
          id: element.id,
          name: element.name,
        ));
      }
    });

    return rt;
  }

  @override
  Future<List<RowItem<ServiceTimeFrame>>> getServiceTimeFrameList(String typeId) async {
    final path = StringUtils.replacePathParams(ApiEndpoints.serviceTypeTimeFrames, {'id': typeId});

    final result = await Result.guardAsync(() => get(path));

    final List<RowItem<ServiceTimeFrame>> rt = [];

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final list = res.data?.map((e) => ServiceTimeFrame.fromJson(e)).toList() ?? [];

      for (var element in list) {
        final startTimeStr = DateTimeUtils.convertMillisecondsToHours(element.startTime);
        final endTimeStr = DateTimeUtils.convertMillisecondsToHours(element.endTime);

        rt.add(
          RowItem(
            id: list.indexOf(element).toString(),
            name: '$startTimeStr - $endTimeStr',
            value: element,
          ),
        );
      }
    });

    return rt;
  }

  @override
  Future<List<RowItem<ServiceLocation>>> getLocationTagList(
      String facilityId, ServiceLocationQueries queries) async {
    final rt = <RowItem<ServiceLocation>>[];
    final path = StringUtils.replacePathParams(ApiEndpoints.serviceLocation, {'id': facilityId});

    final result = await Result.guardAsync(() => get(path, null, queries.toJson()));

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final list =
          (res.data as List<dynamic>?)?.map((e) => ServiceLocationData.fromJson(e)).toList() ?? [];

      for (var element in list) {
        rt.add(RowItem(
          id: element.id,
          name: element.note,
          value: ServiceLocation(
            id: element.id ?? '',
            isMaxSlot: element.isMaxSlot ?? false,
            unitPrice: element.unitPrice ?? 0,
          ),
        ));
      }
    });

    return rt;
  }

  @override
  Future<bool> registerService(ServiceRegistrationBody body) async {
    bool isSuccess = false;

    final result =
        await Result.guardAsync(() => post(ApiEndpoints.createServiceRegistration, body));

    result.ifSuccess((data) {
      isSuccess = true;
    });

    return isSuccess;
  }
}
