import 'package:equatable/equatable.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_detail_model.dart';

class ContractDetailState extends Equatable {
  final String? id;
  final ContractDetailModel? contractDetail;

  const ContractDetailState({this.id, this.contractDetail});

  ContractDetailState copyWith({
    String? id,
    ContractDetailModel? contractDetail,
  }) {
    return ContractDetailState(
      id: id ?? this.id,
      contractDetail: contractDetail ?? this.contractDetail,
    );
  }

  @override
  List<Object?> get props => [
        id,
        contractDetail,
      ];
}
