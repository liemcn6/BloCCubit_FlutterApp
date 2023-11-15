import 'package:home_care/data/models/request/service/service_detail_list_req.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';

mixin ServiceDetailRepo {
  Future<List<ServiceDetail>> getServiceDetailList({ServiceDetailListReq? body});
  Future<ServiceDetail> getServiceDetail({required String id});
  Future<bool> bookingService({required Map<String, dynamic> body});
}
