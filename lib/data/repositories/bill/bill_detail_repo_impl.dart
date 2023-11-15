import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/bill/bill_detail_data_response.dart';
import 'package:home_care/domain/entities/bill/bill_detail.dart';
import 'package:home_care/domain/entities/bill/invoice_payment_history.dart';
import 'package:home_care/domain/entities/bill/period_transaction.dart';
import 'package:home_care/domain/repositories/bill/bill_detail_repo.dart';

class BillDetailRepoImpl extends BaseRepository with BillDetailRepo {
  @override
  Future<BillDetail?> getBillDetail(String billId) async {
    final path = StringUtils.replacePathParams(ApiEndpoints.billDetail, {"id": billId});
    final result = await Result.guardAsync(() => get(path));

    if (result.isSuccess) {
      final res = BaseResponse.fromJson(result.data?.data);
      final data = BillDetailDataResponse.fromJson(res.data);

      final periodTrans = data.periodTransactions
          ?.map(
            (e) => PeriodTransaction(
              buildingServiceName: e.buildingServiceName ?? '',
              note: e.note ?? '',
              unitPriceWithVat: e.unitPriceWithVat ?? 0,
              quantity: e.quantity ?? 0,
              totalPriceWithVat: e.totalPriceWithVat ?? 0,
              id: e.id ?? '',
              totalMonth: e.totalMonth ?? 0,
              totalPaidAmount: e.totalPaidAmount ?? 0,
              unitOfMeasureName: e.unitOfMeasureName ?? '',
            ),
          )
          .toList();

      final invoicePaymentHistories = data.invoicePaymentHistories
          ?.map(
            (e) => InvoicePaymentHistory(
              transactionDate: e.transactionDate ?? DateTime.now(),
              bankAccountNumber: e.bankAccountNumber ?? '',
              bankName: e.bankName ?? '',
              note: e.note ?? '',
              amount: e.amount ?? 0,
            ),
          )
          .toList();

      return BillDetail(
        invoiceIssuingAddress: data.invoiceIssuingAddress ?? '',
        invoiceNumber: data.invoiceNumber ?? '',
        issueDate: data.issuedDate ?? DateTime.now(),
        note: data.note ?? '',
        organizationName: data.organizationName ?? '',
        status: data.status ?? '',
        periodTransactions: periodTrans ?? [],
        totalAmount: data.totalAmount ?? 0,
        totalAmountNotVat: data.totalAmountNotVat ?? 0,
        totalPaidAmount: data.totalPaidAmount ?? 0,
        invoicePaymentHistories: invoicePaymentHistories ?? [],
      );
    }

    return null;
  }
}
