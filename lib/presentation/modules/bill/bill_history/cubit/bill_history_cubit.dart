import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/bill/invoice_payment_history.dart';
import 'package:home_care/domain/usecases/bill/bill_detail_usecase.dart';

part 'bill_history_state.dart';

class BillHistoryCubit extends Cubit<BillHistoryState> {
  final detailUseCase = getIt.get<BillDetailUseCase>();
  final String billId;

  BillHistoryCubit(this.billId) : super(BillHistoryInitial());

  Future getBillHistory() async {
    emit(state.copyWith(isLoaded: false));
    final result = await detailUseCase.getBillDetail(billId);

    emit(state.copyWith(
      invoicePaymentHistories: result?.invoicePaymentHistories ?? [],
      isLoaded: true,
    ));
  }
}
