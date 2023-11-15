import 'package:home_care/data/models/request/payment/payment_list_req_queries.dart';
import 'package:home_care/domain/entities/payment_management/payment_history.dart';

mixin PaymentHistoryRepo {
  Future<List<PaymentHistory>> getPaymentHistory(PaymentListReqQueries queries);
}
