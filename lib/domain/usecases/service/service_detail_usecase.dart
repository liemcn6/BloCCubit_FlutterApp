import 'package:home_care/data/models/request/service/service_detail_list_req.dart';
import 'package:home_care/domain/entities/service/service_detail.dart';
import 'package:home_care/domain/repositories/service/service_detail_repo.dart';

class ServiceDetailUseCase {
  final ServiceDetailRepo _repository;

  ServiceDetailUseCase(this._repository);

  Future<List<ServiceDetail>> getServiceDetailList({ServiceDetailListReq? body}) async {
    return await _repository.getServiceDetailList(body: body);
  }

  Future<ServiceDetail> getServiceDetail({required String id}) async {
    return await _repository.getServiceDetail(id: id);
  }

  Future<bool> bookingService({required Map<String, dynamic> body}) async {
    return await _repository.bookingService(
      body: body,
    );
  }
}
