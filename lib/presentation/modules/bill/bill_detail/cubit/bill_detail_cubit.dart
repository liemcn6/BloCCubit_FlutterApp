import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/entities/bill/bill_detail.dart';
import 'package:home_care/domain/usecases/bill/bill_detail_usecase.dart';

part 'bill_detail_state.dart';

class BillDetailCubit extends Cubit<BillDetailState> {
  final String billId;
  final useCase = getIt<BillDetailUseCase>();

  BillDetailCubit(this.billId) : super(BillDetailInitial());

  Future getBillDetail() async {
    emit(state.copyWith(isLoaded: false));
    final result = await useCase.getBillDetail(billId);
    emit(state.copyWith(isLoaded: true, billDetail: result));
  }
}
