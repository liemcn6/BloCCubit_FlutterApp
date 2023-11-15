import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/request/payment/payment_list_req_queries.dart';
import 'package:home_care/domain/entities/payment_management/payment_item.dart';
import 'package:home_care/domain/entities/payment_management/payment_statistic.dart';
import 'package:home_care/domain/usecases/payment_management/payment_list_detail_usecase.dart';
import 'package:home_care/domain/usecases/payment_management/payment_list_usecase.dart';

part 'payment_list_detail_state.dart';

class PaymentListDetailCubit extends Cubit<PaymentListDetailState> {
  final usecase = getIt<PaymentListDetailUsecase>();
  final listUsecase = getIt<PaymentListUseCase>();
  PaymentListDetailCubit() : super(PaymentListDetailInitial());

  Future getPaymentListDetail(String contractId) async {
    final queries = PaymentListReqQueries(contractIds: [contractId]);
    final result = await Result.guardAsync(() => usecase.getPaymentListDetail(queries));

    result.ifSuccess((data) {
      final list = data as List<PaymentItem>;
      emit(state.copyWith(listPayments: list, isLoaded: true));
    });
  }

  Future getPaymentStatistic(String contractId) async {
    final result = await Result.guardAsync(() => listUsecase.getPaymentStatistic());

    result.ifSuccess((data) {
      final statistic = data as PaymentStatistic;
      emit(state.copyWith(statistic: statistic));
    });
  }

  Future onRefresh(String contractId) async {
    emit(state.copyWith(isLoaded: false));
    await Future.wait([
      getPaymentStatistic(contractId),
      getPaymentListDetail(contractId),
    ]);
    emit(state.copyWith(isLoaded: true));
  }

  onLoadMore() {}
}
