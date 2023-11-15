import 'package:home_care/data/models/request/contract/contract_queries_request.dart';
import 'package:home_care/domain/entities/payment_management/payment_statistic.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';

mixin PaymentListRepo {
  Future<List<ContractModel>> getContractPaymentList(ContractQueriesRequest queries);
  Future<PaymentStatistic> getPaymentStatistic();
}
