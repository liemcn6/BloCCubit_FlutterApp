import 'package:home_care/domain/entities/service/service_register_detail.dart';

mixin ServiceHistoryRepo {
  Future<ServiceRegisterDetail> getServiceRegisterDetail({required String id});
  Future<bool> postServiceCancel({required String id, required String request});
  Future<bool> postServiceCancelApproval({required String id, required String request});
}