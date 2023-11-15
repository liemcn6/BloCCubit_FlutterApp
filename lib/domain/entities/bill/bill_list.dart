class BillList {
  final List<BillListData> data;

  const BillList({
    this.data = const [],
  });
}

class BillListData {
  final String id;
  final String invoiceNumber;
  final DateTime issuedDate;
  final String status;
  final double totalAmount;

  BillListData({
    required this.id,
    required this.invoiceNumber,
    required this.issuedDate,
    required this.status,
    required this.totalAmount,
  });
}
