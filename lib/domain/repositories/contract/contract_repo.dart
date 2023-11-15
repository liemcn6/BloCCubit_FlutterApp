import 'package:dio/dio.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/modules/contract/model/entities/contract_dto.dart';

mixin ContractRepo {
  Future<Result<Response>> getContracts({ContractDto? filter});
  Future<Result<Response>> getContractDetail({required String id});
}
