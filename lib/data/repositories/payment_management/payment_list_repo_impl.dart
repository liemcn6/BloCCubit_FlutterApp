import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/contract/contract_queries_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/payment/payment_statistic_data_response.dart';
import 'package:home_care/domain/entities/payment_management/payment_statistic.dart';
import 'package:home_care/domain/repositories/payment/payment_list_repo.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';

class PaymentListRepoImpl extends BaseRepository with PaymentListRepo {
  @override
  Future<List<ContractModel>> getContractPaymentList(ContractQueriesRequest queries) async {
    final List<ContractModel> contractList = [];
    final result = await Result.guardAsync(
      () => get(
        ApiEndpoints.contractList,
        null,
        queries.toJson(),
      ),
    );

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);

      if (res.data != null) {
        final List<dynamic> list = res.data;
        for (var element in list) {
          final contract = ContractModel.fromJson(element);
          contractList.add(contract);
        }
      }
    });

    return contractList;
  }

  @override
  Future<PaymentStatistic> getPaymentStatistic() async {
    PaymentStatistic paymentStatistic = const PaymentStatistic();
    final result = await Result.guardAsync(() => get(ApiEndpoints.paymentStatistic));

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final statistic = PaymentStatisticDataResponse.fromJson(res.data);

      paymentStatistic = PaymentStatistic(totalNeedToPay: statistic.totalNeedToPay ?? 0);
    });

    return paymentStatistic;
  }
}
