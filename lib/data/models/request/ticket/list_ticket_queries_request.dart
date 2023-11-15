class ListTicketQueriesRequest {
  final List<String> statuses;
  final int pageSize;
  final int pageIndex;

  const ListTicketQueriesRequest({
    this.statuses = const [],
    this.pageSize = 10,
    this.pageIndex = 0,
  });

  ListTicketQueriesRequest copyWith({
    List<String>? statuses,
    int? pageSize,
    int? pageIndex,
  }) {
    return ListTicketQueriesRequest(
      statuses: statuses ?? this.statuses,
      pageSize: pageSize ?? this.pageSize,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statuses': statuses,
      'pageSize': pageSize,
      'pageIndex': pageIndex,
    };
  }
}
