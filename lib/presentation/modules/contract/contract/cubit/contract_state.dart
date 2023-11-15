import 'package:equatable/equatable.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_dto.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_model.dart';

class ContractState extends Equatable {
  final List<ContractModel>? listContracts;
  final bool? enableLoadMore;
  final ContractDto? filter;

  const ContractState({
    this.listContracts,
    this.enableLoadMore,
    this.filter,
  });

  ContractState copyWith({
    List<ContractModel>? listContracts,
    bool? enableLoadMore,
    ContractDto? filter,
  }) {
    return ContractState(
      listContracts: listContracts ?? this.listContracts,
      enableLoadMore: enableLoadMore ?? this.enableLoadMore,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [
        listContracts,
        enableLoadMore,
        filter,
      ];
}
