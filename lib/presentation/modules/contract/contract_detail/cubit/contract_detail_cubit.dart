import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/usecases/contract/contract_usecase.dart';
import 'package:home_care/presentation/modules/contract/contract_detail/cubit/contract_detail_state.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_detail_model.dart';

class ContractDetailCubit extends Cubit<ContractDetailState> {
  ContractDetailCubit() : super(const ContractDetailState());

  final _usecase = getIt.get<ContractUseCase>();

  Future<void> getInit(BuildContext context, {required String contractId}) async {
    await getDetailContract(context, contractId: contractId);
  }

  Future<void> handlerRefresh(BuildContext context, String contractId) async {
    await getInit(context, contractId: contractId);
  }

  Future<void> getDetailContract(BuildContext context, {String? contractId}) async {
    Utils.showLoading();
    final result = await _usecase.getContractDetail(id: contractId ?? '');
    result.ifSuccess(
      (data) {
        if (!Utils.isNullOrEmpty(data?.data)) {
          final dataResponse = BaseResponse.fromJson(data?.data);
          final contractDetail = ContractDetailModel.fromJson(dataResponse.data);
          emit(state.copyWith(contractDetail: contractDetail));
        }
      },
    );
    Utils.hideLoading();
  }
}
