import 'package:home_care/domain/entities/service/service_register_detail.dart';
import 'package:home_care/domain/repositories/service/service_history_repo.dart';

class ServiceHistoryUseCase {
  final ServiceHistoryRepo _repository;

  ServiceHistoryUseCase(this._repository);

  Future<ServiceRegisterDetail> getServiceRegisterDetail({required String id}) async {
    return await _repository.getServiceRegisterDetail(id: id);
  }

  Future<bool> postServiceCancel({required String id, required String request}) async {
    return await _repository.postServiceCancel(id: id, request: request);
  }

  Future<bool> postServiceCancelApproval({required String id, required String request}) async {
    return await _repository.postServiceCancelApproval(id: id, request: request);
  }
}
