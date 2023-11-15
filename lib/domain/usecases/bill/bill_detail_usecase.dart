import 'package:home_care/data/repositories/bill/bill_detail_repo_impl.dart';
import 'package:home_care/domain/entities/bill/bill_detail.dart';
import 'package:home_care/domain/repositories/bill/bill_detail_repo.dart';

class BillDetailUseCase {
  final BillDetailRepo _billRepository = BillDetailRepoImpl();

  Future<BillDetail?> getBillDetail(String billId) async {
    return await _billRepository.getBillDetail(billId);
  }
}
