class ServiceHistoryDetail {
  final String? action;
  final String? bookingServiceId;
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? id;
  final String? issuedUserId;
  final String? lastModifiedBy;
  final String? reason;
  final String? title;

  ServiceHistoryDetail({
    this.action,
    this.bookingServiceId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.id,
    this.issuedUserId,
    this.lastModifiedBy,
    this.reason,
    this.title,
  });

  ServiceHistoryDetail copyWith({
    String? action,
    String? bookingServiceId,
    int? createdAt,
    String? createdBy,
    bool? deleted,
    String? id,
    String? issuedUserId,
    String? lastModifiedBy,
    String? reason,
    String? title,
  }) =>
      ServiceHistoryDetail(
        action: action ?? this.action,
        bookingServiceId: bookingServiceId ?? this.bookingServiceId,
        createdAt : createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        deleted: deleted ?? this.deleted,
        id: id ?? this.id,
        issuedUserId: issuedUserId ?? this.issuedUserId,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        reason: reason ?? this.reason,
        title: title ?? this.title,
      );

  factory ServiceHistoryDetail.fromJson(Map<String, dynamic> json) => ServiceHistoryDetail(
    action: json["action"],
    bookingServiceId: json["bookingServiceId"],
    createdAt : json["createdAt"],
    createdBy: json["createdBy"],
    deleted: json["deleted"],
    id: json["id"],
    issuedUserId: json["issuedUserId"],
    lastModifiedBy: json["lastModifiedBy"],
    reason: json["reason"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "bookingServiceId": bookingServiceId,
    "createdAt" : createdAt,
    "createdBy": createdBy,
    "deleted": deleted,
    "id": id,
    "issuedUserId": issuedUserId,
    "lastModifiedBy": lastModifiedBy,
    "reason": reason,
    "title": title,
  };
}