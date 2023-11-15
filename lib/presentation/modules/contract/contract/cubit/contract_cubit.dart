import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/usecases/contract/contract_usecase.dart';
import 'package:home_care/presentation/modules/contract/contract/cubit/contract_state.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_dto.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(const ContractState());

  final _usecase = getIt.get<ContractUseCase>();

  Future initData(BuildContext context) async {
    emit(
      state.copyWith(
        filter: ContractDto(
          pageIndex: 1,
          pageSize: AppDefined.defaultPageSize,
          sortBy: 'effectiveDate.desc',
        ),
      ),
    );

    await onRefresh(context);
  }

  Future onRefresh(BuildContext context) async {
    ContractDto? data = state.filter;
    emit(state.copyWith(filter: data?.copyWith(pageIndex: 1)));
    await getListContract(context);
  }

  Future onRequest(BuildContext context) async {
    await getListContract(context);
  }

  Future getListContract(BuildContext context) async {
    Utils.showLoading();
    final result = await _usecase.getContracts(filter: state.filter);

    result.ifSuccess((data) {
      List<ContractModel> listContracts = [];

      if (state.filter?.pageIndex == 1) {
        emit(state.copyWith(listContracts: listContracts));
      }
      final dataResponse = BaseResponse.fromJson(data?.data);

      // Check data is array
      if (dataResponse.data is List) {
        for (var e in dataResponse.data) {
          final rp = ContractModel.fromJson(e);

          listContracts.add(rp);
        }
      }
      emit(
        state.copyWith(
          enableLoadMore: data?.data.length >= AppDefined.defaultPageSize,
          listContracts: listContracts,
        ),
      );
    });

    Utils.hideLoading();
  }

  Future onLoadMore(BuildContext context) async {
    if (state.enableLoadMore ?? false) {
      final index = (state.filter?.pageIndex ?? 0) + 1;
      emit(state.copyWith(enableLoadMore: false, filter: state.filter?.copyWith(pageIndex: index)));
      await getListContract(context);
    }
  }
}
