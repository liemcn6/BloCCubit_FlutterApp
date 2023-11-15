class UploadFileRespData {
  final String? id;
  final String? path;
  final String? originalName;
  final String? hashed;
  final int? size;
  final String? type;
  final String? ownerId;
  final String? ownerType;
  final bool? deleted;
  final int? version;
  final String? downloadUrl;
  final String? viewUrl;

  UploadFileRespData({
    this.id,
    this.path,
    this.originalName,
    this.hashed,
    this.size,
    this.type,
    this.ownerId,
    this.ownerType,
    this.deleted,
    this.version,
    this.downloadUrl,
    this.viewUrl,
  });

  factory UploadFileRespData.fromJson(Map<String, dynamic> json) => UploadFileRespData(
        id: json['id'] as String?,
        path: json['path'] as String?,
        originalName: json['originalName'] as String?,
        hashed: json['hashed'] as String?,
        size: json['size'] as int?,
        type: json['type'] as String?,
        ownerId: json['ownerId'] as String?,
        ownerType: json['ownerType'] as String?,
        deleted: json['deleted'] as bool?,
        version: json['version'] as int?,
        downloadUrl: json['downloadUrl'] as String?,
        viewUrl: json['viewUrl'] as String?,
      );
}
