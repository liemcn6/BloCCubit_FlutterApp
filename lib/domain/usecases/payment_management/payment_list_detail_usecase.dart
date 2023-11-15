import 'package:home_care/data/models/request/payment/payment_list_req_queries.dart';
import 'package:home_care/data/repositories/payment_management/payment_list_detai_repo_impl.dart';
import 'package:home_care/domain/entities/payment_management/payment_item.dart';
import 'package:home_care/domain/repositories/payment/payment_list_detail_repo.dart';

class PaymentListDetailUsecase {
  final PaymentListDetailRepo _repo = PaymentListDetailRepoImpl();

  Future<List<PaymentItem>> getPaymentListDetail(PaymentListReqQueries queries) async {
    return await _repo.getPaymentListDetail(queries);
  }
}
