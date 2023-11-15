import 'package:home_care/presentation/modules/home/models/files_model.dart';
import 'package:home_care/presentation/modules/home/models/target_model.dart';

class LastestNewsModel {
  String? approvalStatus;
  String? avatarFileUrl;
  String? catalogId;
  String? catalogName;
  String? code;
  String? content;
  String? contentType;
  int? createdAt;
  String? createdBy;
  bool? deleted;
  String? description;
  List<FilesModel>? files;
  String? id;
  String? illustrationId;
  String? languageId;
  int? lastModifiedAt;
  String? lastModifiedBy;
  String? note;
  int? postAt;
  String? reason;
  int? removeAt;
  String? status;
  List<TargetModel>? targets;
  String? title;
  String? viewIllustrationUrl;
  bool? waitApproval;

  LastestNewsModel({
    this.approvalStatus,
    this.avatarFileUrl,
    this.catalogId,
    this.catalogName,
    this.code,
    this.content,
    this.contentType,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.description,
    this.files,
    this.id,
    this.illustrationId,
    this.languageId,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.note,
    this.postAt,
    this.reason,
    this.removeAt,
    this.status,
    this.targets,
    this.title,
    this.viewIllustrationUrl,
    this.waitApproval,
  });

  factory LastestNewsModel.fromJson(Map<String, dynamic> json) => LastestNewsModel(
        approvalStatus: json['approvalStatus'] as String?,
        avatarFileUrl: json['avatarFileUrl'] as String?,
        catalogId: json['catalogId'] as String?,
        catalogName: json['catalogName'] as String?,
        code: json['code'] as String?,
        content: json['content'] as String?,
        contentType: json['contentType'] as String?,
        createdAt: json['createdAt'] as int?,
        createdBy: json['createdBy'] as String?,
        deleted: json['deleted'] as bool?,
        description: json['description'] as String?,
        files: (json['files'] as List<dynamic>?)
            ?.map((e) => FilesModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as String?,
        illustrationId: json['illustrationId'] as String?,
        languageId: json['languageId'] as String?,
        lastModifiedAt: json['lastModifiedAt'] as int?,
        lastModifiedBy: json['lastModifiedBy'] as String?,
        note: json['note'] as String?,
        postAt: json['postAt'] as int?,
        reason: json['reason'] as String?,
        removeAt: json['removeAt'] as int?,
        status: json['status'] as String?,
        targets: (json['targets'] as List<dynamic>?)
            ?.map((e) => TargetModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        title: json['title'] as String?,
        viewIllustrationUrl: json['viewIllustrationUrl'] as String?,
        waitApproval: json['waitApproval'] as bool?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'approvalStatus': approvalStatus,
        'avatarFileUrl': avatarFileUrl,
        'catalogId': catalogId,
        'catalogName': catalogName,
        'code': code,
        'content': content,
        'contentType': contentType,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'deleted': deleted,
        'description': description,
        'files': files,
        'id': id,
        'illustrationId': illustrationId,
        'languageId': languageId,
        'lastModifiedAt': lastModifiedAt,
        'lastModifiedBy': lastModifiedBy,
        'note': note,
        'postAt': postAt,
        'reason': reason,
        'removeAt': removeAt,
        'status': status,
        'targets': targets,
        'title': title,
        'viewIllustrationUrl': viewIllustrationUrl,
        'waitApproval': waitApproval,
      };
}
