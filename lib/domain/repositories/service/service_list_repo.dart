import '../../entities/service/service_detail.dart';
import '../../entities/service/service_history.dart';
import '../../entities/service/service_history_type.dart';
import '../../entities/service/service_list.dart';

mixin ServiceListRepo {
  Future<ServiceList> getServiceList();
  Future<List<ServiceDetail>> getServiceRecent();
  Future<ServiceHistory> getServiceHistory(Map<String, dynamic>? queries);
  Future<ServiceHistoryType> getServiceHistoryType();
}
