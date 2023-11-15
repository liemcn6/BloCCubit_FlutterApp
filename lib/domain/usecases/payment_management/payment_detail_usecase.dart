import 'package:home_care/data/models/request/payment/payment_detail_req_queries.dart';
import 'package:home_care/data/repositories/payment_management/payment_detail_repo_impl.dart';
import 'package:home_care/domain/entities/payment_management/payment_detail.dart';
import 'package:home_care/domain/repositories/payment/payment_detail_repo.dart';

class PaymentDetailUseCase {
  final PaymentDetailRepo _repo = PaymentDetailRepoImpl();

  Future<PaymentDetail> getPaymentDetail(
      {required PaymentDetailReqQueries queries, required String paymentId}) async {
    return await _repo.getPaymentDetail(queries: queries, paymentId: paymentId);
  }
}
