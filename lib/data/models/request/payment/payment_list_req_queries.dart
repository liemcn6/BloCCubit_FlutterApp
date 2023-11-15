class PaymentListReqQueries {
  final int pageIndex;
  final int pageSize;
  final List<String> contractIds;

  const PaymentListReqQueries({
    this.pageIndex = 1,
    this.pageSize = 30,
    required this.contractIds,
  });

  Map<String, dynamic> toJson() => {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
        'contractIds': contractIds,
      };

  PaymentListReqQueries copyWith({
    int? pageIndex,
    int? pageSize,
    List<String>? contractIds,
  }) {
    return PaymentListReqQueries(
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      contractIds: contractIds ?? this.contractIds,
    );
  }
}
