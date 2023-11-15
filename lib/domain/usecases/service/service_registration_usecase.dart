import 'package:home_care/data/models/request/service/service_location_queries.dart';
import 'package:home_care/data/models/request/service/service_registration_body.dart';
import 'package:home_care/data/models/request/service/service_type_queries.dart';
import 'package:home_care/data/models/response/service/service_time_frame_data.dart';
import 'package:home_care/domain/entities/bottom_sheet/row_item.dart';
import 'package:home_care/domain/entities/service/service_location.dart';
import 'package:home_care/domain/repositories/building/building_repo.dart';
import 'package:home_care/domain/repositories/service/service_registration_repo.dart';

class ServiceRegistrationUseCase {
  final ServiceRegistrationRepo _serviceRepository;
  final BuildingRepo _buildingRepository;

  ServiceRegistrationUseCase(this._serviceRepository, this._buildingRepository);

  Future<List<RowItem>> getServiceGroupList() async {
    return await _serviceRepository.getServiceGroupList();
  }

  Future<List<RowItem>> getServiceTypeList(String grId) async {
    final buildingIds = await _buildingRepository.getUserBuildingList();
    final queries = ServiceTypeQueries(
      buildingIds: buildingIds.map((e) => e.id ?? '').toList(),
      facilityGroupIds: [grId],
    );

    return await _serviceRepository.getServiceTypeList(queries);
  }

  Future<List<RowItem<ServiceTimeFrame>>> getServiceTimeFrameList(String typeId) async {
    return await _serviceRepository.getServiceTimeFrameList(typeId);
  }

  Future<List<RowItem<ServiceLocation>>> getServiceLocationList(
      String facilityId, ServiceLocationQueries queries) async {
    return await _serviceRepository.getLocationTagList(facilityId, queries);
  }

  Future<bool> registerService(ServiceRegistrationBody body) async {
    return await _serviceRepository.registerService(body);
  }
}
