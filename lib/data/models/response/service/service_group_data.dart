class ServiceGroupData {
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? description;
  final String? id;
  final IllustrationFile? illustrationFile;
  final String? illustrationFileIds;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? name;
  final String? status;

  ServiceGroupData({
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.description,
    this.id,
    this.illustrationFile,
    this.illustrationFileIds,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.name,
    this.status,
  });

  factory ServiceGroupData.fromJson(Map<String, dynamic> json) => ServiceGroupData(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        description: json["description"],
        id: json["id"],
        illustrationFile: json["illustrationFile"] == null
            ? null
            : IllustrationFile.fromJson(json["illustrationFile"]),
        illustrationFileIds: json["illustrationFileIds"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        name: json["name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "description": description,
        "id": id,
        "illustrationFile": illustrationFile?.toJson(),
        "illustrationFileIds": illustrationFileIds,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "name": name,
        "status": status,
      };
}

class IllustrationFile {
  final DateTime? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? downloadUrl;
  final String? hashed;
  final String? id;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? originalName;
  final String? ownerId;
  final String? ownerType;
  final String? path;
  final int? size;
  final String? type;
  final int? version;
  final String? viewUrl;

  IllustrationFile({
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.downloadUrl,
    this.hashed,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.originalName,
    this.ownerId,
    this.ownerType,
    this.path,
    this.size,
    this.type,
    this.version,
    this.viewUrl,
  });

  factory IllustrationFile.fromJson(Map<String, dynamic> json) => IllustrationFile(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        hashed: json["hashed"],
        id: json["id"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
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
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "deleted": deleted,
        "downloadUrl": downloadUrl,
        "hashed": hashed,
        "id": id,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
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
