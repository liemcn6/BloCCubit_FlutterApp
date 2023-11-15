import 'dart:convert';

class ServiceListResponse {
  int? code;
  List<Datum>? data;
  String? message;
  Page? page;
  String? status;
  bool? success;
  int? timestamp;

  ServiceListResponse({
    this.code,
    this.data,
    this.message,
    this.page,
    this.status,
    this.success,
    this.timestamp,
  });

  factory ServiceListResponse.fromRawJson(String str) =>
      ServiceListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceListResponse.fromJson(Map<String, dynamic> json) => ServiceListResponse(
        code: json["code"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
        status: json["status"],
        success: json["success"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "page": page?.toJson(),
        "status": status,
        "success": success,
        "timestamp": timestamp,
      };
}

class Datum {
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  String? description;
  String? id;
  IllustrationFile? illustrationFile;
  String? illustrationFileIds;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? name;
  String? status;

  Datum({
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  DateTime? createdAt;
  String? createdBy;
  bool? deleted;
  String? downloadUrl;
  String? hashed;
  String? id;
  DateTime? lastModifiedAt;
  String? lastModifiedBy;
  String? originalName;
  String? ownerId;
  String? ownerType;
  String? path;
  int? size;
  String? type;
  int? version;
  String? viewUrl;

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

  factory IllustrationFile.fromRawJson(String str) => IllustrationFile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IllustrationFile.fromJson(Map<String, dynamic> json) => IllustrationFile(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["createdAt"]),
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        downloadUrl: json["downloadUrl"],
        hashed: json["hashed"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json["lastModifiedAt"]),
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

class Page {
  int? pageIndex;
  int? pageSize;
  int? total;

  Page({
    this.pageIndex,
    this.pageSize,
    this.total,
  });

  factory Page.fromRawJson(String str) => Page.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageIndex: json["pageIndex"],
        pageSize: json["pageSize"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "total": total,
      };
}
