import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/payment/payment_list_req_queries.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/payment/payment_history_data_response.dart';
import 'package:home_care/domain/entities/payment_management/payment_history.dart';
import 'package:home_care/domain/repositories/payment/payment_history_repo.dart';

class PaymentHistoryRepoImpl extends BaseRepository with PaymentHistoryRepo {
  @override
  Future<List<PaymentHistory>> getPaymentHistory(PaymentListReqQueries queries) async {
    final List<PaymentHistory> paymentHistory = [];
    final result = await Result.guardAsync(
      () => get(ApiEndpoints.paymentHistory, null, queries.toJson()),
    );

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);

      final list = res.data as List<dynamic>?;

      if (list != null) {
        for (var element in list) {
          final historyData = PaymentHistoryDataResponse.fromJson(element);

          paymentHistory.add(PaymentHistory(
            lastPaymentAt: historyData.lastPaymentAt,
            note: historyData.note,
            paidAmount: historyData.paidAmount ?? 0,
            transactionId: historyData.lastPaymentAt,
          ));
        }
      }
    });

    return paymentHistory;
  }
}
