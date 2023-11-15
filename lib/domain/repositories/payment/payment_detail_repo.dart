import 'package:home_care/data/models/request/payment/payment_detail_req_queries.dart';
import 'package:home_care/domain/entities/payment_management/payment_detail.dart';

mixin PaymentDetailRepo {
  Future<PaymentDetail> getPaymentDetail({
    required PaymentDetailReqQueries queries,
    required String paymentId,
  });
}
