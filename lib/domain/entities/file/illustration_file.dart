import 'package:home_care/data/models/response/ticket/illustration_file_response.dart';

class IllustrationFile {
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

  IllustrationFile({
    this.complaintId,
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

  factory IllustrationFile.fromJson(Map<String, dynamic> json) => IllustrationFile(
        complaintId: json['complaintId'] as String?,
        createdBy: json['createdBy'] as String?,
        createdAt: json['createdAt'] as int?,
        lastModifiedBy: json['lastModifiedBy'] as String?,
        lastModifiedAt: json['lastModifiedAt'] as int?,
        id: json['id'] as String?,
        ticketId: json['ticketId'] as String?,
        fileId: json['fileId'] as String?,
        fileType: json['fileType'] as String?,
        deleted: json['deleted'] as bool?,
        originalName: json['originalName'] as String?,
        viewUrl: json['viewUrl'] as String?,
        downloadUrl: json['downloadUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'complaintId': complaintId,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'lastModifiedBy': lastModifiedBy,
        'lastModifiedAt': lastModifiedAt,
        'id': id,
        'ticketId': ticketId,
        'fileId': fileId,
        'fileType': fileType,
        'deleted': deleted,
        'originalName': originalName,
        'viewUrl': viewUrl,
        'downloadUrl': downloadUrl,
      };

  factory IllustrationFile.fromEntity(IllustrationsFileResponse? file) => IllustrationFile(
        complaintId: file?.complaintId,
        createdBy: file?.createdBy,
        createdAt: file?.createdAt,
        lastModifiedBy: file?.lastModifiedBy,
        lastModifiedAt: file?.lastModifiedAt,
        id: file?.id,
        ticketId: file?.ticketId,
        fileId: file?.fileId,
        fileType: file?.fileType,
        deleted: file?.deleted,
        originalName: file?.originalName,
        viewUrl: file?.viewUrl,
        downloadUrl: file?.downloadUrl,
      );
}
