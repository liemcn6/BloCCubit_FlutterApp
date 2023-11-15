import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/contract/contract_queries_request.dart';
import 'package:home_care/domain/entities/payment_management/payment_statistic.dart';
import 'package:home_care/domain/usecases/payment_management/payment_list_usecase.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';

part 'payment_list_state.dart';

class PaymentListCubit extends Cubit<PaymentListState> {
  PaymentListCubit() : super(PaymentListInitial());

  final usecase = getIt.get<PaymentListUseCase>();

  Future getPaymentContractList() async {
    const queries = ContractQueriesRequest(pageIndex: 1, pageSize: 30);

    final result = await usecase.getContractPaymentList(queries);

    emit(state.copyWith(paymentList: result));
  }

  Future getPaymentStatistic() async {
    final result = await usecase.getPaymentStatistic();

    emit(state.copyWith(statistic: result));
  }

  Future onRefresh() async {
    emit(state.copyWith(isLoaded: false));
    await Future.wait([
      getPaymentContractList(),
      getPaymentStatistic(),
    ]);
    emit(state.copyWith(isLoaded: true));
  }

  Future onLoadMore() async {}
}
