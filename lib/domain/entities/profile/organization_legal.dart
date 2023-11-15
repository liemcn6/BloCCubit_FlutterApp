class OrganizationLegal {
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? downloadUrl;
  final String? fileId;
  final String? id;
  final int? lastModifiedAt;
  final String? lastModifiedBy;
  final String? organizationId;
  final String? originalName;
  final String? type;
  final String? viewUrl;

  OrganizationLegal({
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.downloadUrl,
    this.fileId,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.organizationId,
    this.originalName,
    this.type,
    this.viewUrl,
  });

  factory OrganizationLegal.fromJson(Map<String, dynamic> json) => OrganizationLegal(
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        fileId: json["fileId"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"],
        lastModifiedBy: json["lastModifiedBy"],
        organizationId: json["organizationId"],
        originalName: json["originalName"],
        type: json["type"],
        viewUrl: json["viewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "downloadUrl": downloadUrl,
        "fileId": fileId,
        "id": id,
        "lastModifiedAt": lastModifiedAt,
        "lastModifiedBy": lastModifiedBy,
        "organizationId": organizationId,
        "originalName": originalName,
        "type": type,
        "viewUrl": viewUrl,
      };
}
