import 'package:home_care/data/models/request/contract/contract_queries_request.dart';
import 'package:home_care/data/repositories/payment_management/payment_list_repo_impl.dart';
import 'package:home_care/domain/entities/payment_management/payment_statistic.dart';
import 'package:home_care/domain/repositories/payment/payment_list_repo.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';

class PaymentListUseCase {
  final PaymentListRepo _paymentListRepo = PaymentListRepoImpl();

  Future<List<ContractModel>> getContractPaymentList(ContractQueriesRequest queries) async {
    return await _paymentListRepo.getContractPaymentList(queries);
  }

  Future<PaymentStatistic> getPaymentStatistic() async {
    return await _paymentListRepo.getPaymentStatistic();
  }
}
