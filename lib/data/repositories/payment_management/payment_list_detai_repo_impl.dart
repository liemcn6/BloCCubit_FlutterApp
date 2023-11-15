import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/payment/payment_list_req_queries.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/payment/payment_list_detail_data_reponse.dart';
import 'package:home_care/domain/entities/payment_management/payment_item.dart';
import 'package:home_care/domain/repositories/payment/payment_list_detail_repo.dart';

class PaymentListDetailRepoImpl extends BaseRepository with PaymentListDetailRepo {
  @override
  Future<List<PaymentItem>> getPaymentListDetail(PaymentListReqQueries queries) async {
    final List<PaymentItem> list = [];
    final result = await Result.guardAsync(
      () => get(
        ApiEndpoints.paymentList,
        null,
        queries.toJson(),
      ),
    );

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final listData = res.data as List<dynamic>?;

      if (listData != null) {
        for (var element in listData) {
          final item = PaymentListDetailDataResponse.fromJson(element);

          list.add(
            PaymentItem(
              leasingPaymentPeriodId: item.leasingPaymentPeriodId ?? '',
              startDate: item.startDate ?? '',
              endDate: item.endDate ?? '',
              contractId: item.contractId ?? '',
              contractNumber: item.contractNumber ?? '',
              total: item.total ?? 0,
              paidAmount: item.paidAmount ?? 0,
              needToPay: item.needToPay ?? 0,
            ),
          );
        }
      }
    });

    return list;
  }
}
