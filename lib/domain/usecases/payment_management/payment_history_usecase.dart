import 'package:home_care/data/models/request/payment/payment_list_req_queries.dart';
import 'package:home_care/data/repositories/payment_management/payment_history_repo_impl.dart';
import 'package:home_care/domain/entities/payment_management/payment_history.dart';
import 'package:home_care/domain/repositories/payment/payment_history_repo.dart';

class PaymentHistoryUseCase {
  final PaymentHistoryRepo _paymentHistoryRepo = PaymentHistoryRepoImpl();

  Future<List<PaymentHistory>> getPaymentHistory(PaymentListReqQueries? queries) async {
    const baseQueries = PaymentListReqQueries(
      pageIndex: 1,
      pageSize: 30,
      contractIds: [],
    );
    return await _paymentHistoryRepo.getPaymentHistory(baseQueries.copyWith(
      pageIndex: queries?.pageIndex,
      pageSize: queries?.pageSize,
      contractIds: queries?.contractIds,
    ));
  }
}
