class ContractQueriesRequest {
  final int? pageSize;
  final int? pageIndex;
  final String? sortBy;

  const ContractQueriesRequest({
    this.pageSize,
    this.pageIndex,
    this.sortBy,
  });

  factory ContractQueriesRequest.fromJson(Map<String, dynamic> json) => ContractQueriesRequest(
        pageSize: json['pageSize'] as int?,
        pageIndex: json['pageIndex'] as int?,
        sortBy: json['sortBy'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pageSize': pageSize,
        'pageIndex': pageIndex,
        'sortBy': sortBy,
      };
}
