import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/payment/payment_detail_req_queries.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/payment/paymen_detail_data_response.dart';
import 'package:home_care/domain/entities/payment_management/payment_detail.dart';
import 'package:home_care/domain/entities/payment_management/payment_period.dart';
import 'package:home_care/domain/repositories/payment/payment_detail_repo.dart';

class PaymentDetailRepoImpl extends BaseRepository with PaymentDetailRepo {
  @override
  Future<PaymentDetail> getPaymentDetail(
      {required PaymentDetailReqQueries queries, required String paymentId}) async {
    PaymentDetail paymentDetail = const PaymentDetail();
    final path = StringUtils.replacePathParams(ApiEndpoints.paymentDetail, {'id': paymentId});
    final result = await Result.guardAsync(() => get(path, null, queries.toJson()));

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final detail = PaymentDetailDataResponse.fromJson(res.data);

      paymentDetail = PaymentDetail(
        needToPay: detail.needToPay ?? 0,
        paidAmount: detail.paidAmount ?? 0,
        total: detail.total ?? 0,
        periodTransactions: detail.periodTransactions
                ?.map((e) => PaymentPeriod(
                      quantity: e.quantity ?? 0,
                      unit: e.unit ?? '',
                      selected: false,
                      totalMonth: e.totalMonth ?? 0,
                      totalPrice: e.totalPrice ?? 0,
                      vat: e.vat ?? 0,
                      buildingServiceId: e.buildingServiceId ?? '',
                      buildingServiceName: e.buildingServiceName ?? '',
                      unitCode: e.unitCode ?? '',
                      unitId: e.unitId ?? '',
                      unitName: e.unitName ?? '',
                      unitPrice: e.unitPrice ?? 0,
                    ))
                .toList() ??
            [],
      );
    });

    return paymentDetail;
  }
}
