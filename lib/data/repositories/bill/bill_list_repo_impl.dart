import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/bill/bill_list_response.dart';
import 'package:home_care/domain/repositories/bill/bill_list_repo.dart';

import '../../../core/core.dart';
import '../../../domain/entities/bill/bill_list.dart';
import '../../data_source/remote/api_endpoints.dart';

class BillListRepoImpl extends BaseRepository with BillListRepo {
  @override
  Future<BillList> getBillList(Map<String, dynamic>? queries) async {
    BillList billList = const BillList(data: []);
    final res = await Result.guardAsync(() => get(ApiEndpoints.billList, null, queries));

    res.ifSuccess((data) {
      final billListResponse = BillListResponse.fromJson(data?.data);
      billList = BillList(
          data: billListResponse.data!
              .map((item) => BillListData(
                  id: item.id ?? '',
                  invoiceNumber: item.invoiceNumber ?? '',
                  issuedDate: item.issuedDate ?? DateTime.now(),
                  status: item.status ?? '',
                  totalAmount: item.totalAmount ?? 0))
              .toList());
    });
    return billList;
  }
}
