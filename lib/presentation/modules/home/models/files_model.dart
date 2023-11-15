class FilesModel {
  String? buildingId;
  int? createdAt;
  String? createdBy;
  bool? deleted;
  String? downloadUrl;
  String? externalId;
  String? fileType;
  String? hashed;
  String? id;
  int? lastModifiedAt;
  String? lastModifiedBy;
  String? organizationId;
  String? originalName;
  String? ownerId;
  String? ownerType;
  String? path;
  int? size;
  String? type;
  int? version;
  String? viewUrl;

  FilesModel({
    this.buildingId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.downloadUrl,
    this.externalId,
    this.fileType,
    this.hashed,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.organizationId,
    this.originalName,
    this.ownerId,
    this.ownerType,
    this.path,
    this.size,
    this.type,
    this.version,
    this.viewUrl,
  });

  factory FilesModel.fromJson(Map<String, dynamic> json) => FilesModel(
        buildingId: json["buildingId"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        externalId: json["externalId"],
        fileType: json["fileType"],
        hashed: json["hashed"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"],
        lastModifiedBy: json["lastModifiedBy"],
        organizationId: json["organizationId"],
        originalName: json["originalName"],
        ownerId: json["ownerId"],
        ownerType: json["ownerType"],
        path: json["path"],
        size: json["size"],
        type: json["type"],
        version: json["version"],
        viewUrl: json["viewUrl"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "downloadUrl": downloadUrl,
        "externalId": externalId,
        "fileType": fileType,
        "hashed": hashed,
        "id": id,
        "lastModifiedAt": lastModifiedAt,
        "lastModifiedBy": lastModifiedBy,
        "organizationId": organizationId,
        "originalName": originalName,
        "ownerId": ownerId,
        "ownerType": ownerType,
        "path": path,
        "size": size,
        "type": type,
        "version": version,
        "viewUrl": viewUrl,
      };
}
