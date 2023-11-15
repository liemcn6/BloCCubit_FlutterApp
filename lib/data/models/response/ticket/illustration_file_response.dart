class IllustrationsFileResponse {
  String? complaintId;
  String? createdBy;
  int? createdAt;
  String? lastModifiedBy;
  int? lastModifiedAt;
  String? id;
  String? ticketId;
  String? fileId;
  String? fileType;
  bool? deleted;
  String? originalName;
  String? viewUrl;
  String? downloadUrl;

  IllustrationsFileResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.ticketId,
    this.fileId,
    this.fileType,
    this.deleted,
    this.originalName,
    this.viewUrl,
    this.downloadUrl,
  });

  factory IllustrationsFileResponse.fromJson(Map<String, dynamic> json) =>
      IllustrationsFileResponse(
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedAt: json['lastModifiedAt'],
        id: json['id'],
        ticketId: json['ticketId'],
        fileId: json['fileId'],
        fileType: json['fileType'],
        deleted: json['deleted'],
        originalName: json['originalName'],
        viewUrl: json['viewUrl'],
        downloadUrl: json['downloadUrl'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['createdBy'] = createdBy;
    data['createdAt'] = createdAt;
    data['lastModifiedBy'] = lastModifiedBy;
    data['lastModifiedAt'] = lastModifiedAt;
    data['id'] = id;
    data['ticketId'] = ticketId;
    data['fileId'] = fileId;
    data['fileType'] = fileType;
    data['deleted'] = deleted;
    data['originalName'] = originalName;
    data['viewUrl'] = viewUrl;
    data['downloadUrl'] = downloadUrl;
    return data;
  }
}
