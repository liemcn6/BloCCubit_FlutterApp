import 'package:home_care/domain/entities/service/service_history_type.dart';

import '../../entities/service/service_detail.dart';
import '../../entities/service/service_history.dart';
import '../../entities/service/service_list.dart';
import '../../repositories/service/service_list_repo.dart';

class ServiceListUseCase {
  final ServiceListRepo _repository;

  ServiceListUseCase(this._repository);

  Future<ServiceList> getServiceList() async {
    return await _repository.getServiceList();
  }

  Future<List<ServiceDetail>> getServiceRecent() async {
    return await _repository.getServiceRecent();
  }

  Future<ServiceHistory> getServiceHistory(Map<String, dynamic>? queries) async {
    return await _repository.getServiceHistory(queries);
  }

  Future<ServiceHistoryType> getServiceHistoryType() async {
    return await _repository.getServiceHistoryType();
  }
}
