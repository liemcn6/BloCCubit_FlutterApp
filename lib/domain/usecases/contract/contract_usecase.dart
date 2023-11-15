import 'package:dio/dio.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/domain/repositories/contract/contract_repo.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_dto.dart';

class ContractUseCase {
  final ContractRepo _repo;

  ContractUseCase(this._repo);

  Future<Result<Response>> getContracts({ContractDto? filter}) async {
    return await _repo.getContracts(filter: filter);
  }

  Future<Result<Response>> getContractDetail({required String id}) async {
    return await _repo.getContractDetail(id: id);
  }
}
