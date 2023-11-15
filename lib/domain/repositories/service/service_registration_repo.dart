import 'package:home_care/data/models/request/service/service_location_queries.dart';
import 'package:home_care/data/models/request/service/service_registration_body.dart';
import 'package:home_care/data/models/request/service/service_type_queries.dart';
import 'package:home_care/data/models/response/service/service_time_frame_data.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/service/service_location.dart';

mixin ServiceRegistrationRepo {
  Future<List<RowItem>> getServiceGroupList();
  Future<List<RowItem>> getServiceTypeList(ServiceTypeQueries queries);
  Future<List<RowItem<ServiceTimeFrame>>> getServiceTimeFrameList(String typeId);
  Future<List<RowItem<ServiceLocation>>> getLocationTagList(
      String facilityId, ServiceLocationQueries queries);
  Future<bool> registerService(ServiceRegistrationBody body);
}
