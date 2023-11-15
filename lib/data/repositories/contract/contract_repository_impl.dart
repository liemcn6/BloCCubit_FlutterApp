import 'package:dio/dio.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/domain/repositories/contract/contract_repo.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_dto.dart';

class ContractRepositoryImpl extends BaseRepository implements ContractRepo {
  @override
  Future<Result<Response>> getContracts({ContractDto? filter}) async {
    return await Result.guardAsync(() => get(ApiEndpoints.contractList, null, filter?.toJson()));
  }

  @override
  Future<Result<Response>> getContractDetail({required String id}) async {
    return await Result.guardAsync(() => get(ApiEndpoints.contractDetail(id)));
  }
}
