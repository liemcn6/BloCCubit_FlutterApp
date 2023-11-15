import 'package:home_care/domain/entities/bill/bill_detail.dart';

mixin BillDetailRepo {
  Future<BillDetail?> getBillDetail(String billId);
}
