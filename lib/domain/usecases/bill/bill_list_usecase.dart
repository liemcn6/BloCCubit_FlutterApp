import 'package:home_care/domain/repositories/bill/bill_list_repo.dart';

import '../../entities/bill/bill_list.dart';

class BillListUseCase {
  final BillListRepo _repository;

  BillListUseCase(this._repository);

  Future<BillList> getBillList(Map<String, dynamic>? queries) async {
    return await _repository.getBillList(queries);
  }
}
