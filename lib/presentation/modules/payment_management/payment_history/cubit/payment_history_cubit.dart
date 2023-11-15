import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/payment_management/payment_history.dart';
import 'package:home_care/domain/usecases/payment_management/payment_history_usecase.dart';

part 'payment_history_state.dart';

class PaymentHistoryCubit extends Cubit<PaymentHistoryState> {
  final useCase = getIt.get<PaymentHistoryUseCase>();
  PaymentHistoryCubit() : super(PaymentHistoryInitial());

  Future getPaymentHistory() async {
    emit(state.copyWith(isLoaded: false));
    final result = await useCase.getPaymentHistory(null);
    emit(state.copyWith(isLoaded: true, listPayments: result));
  }

  Future onRefresh() async {
    await getPaymentHistory();
  }
}
