import '../../entities/bill/bill_list.dart';

mixin BillListRepo {
  Future<BillList> getBillList(Map<String, dynamic>? queries);
}
