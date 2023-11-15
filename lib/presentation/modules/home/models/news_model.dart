import 'package:home_care/presentation/modules/home/models/lastest_news_model.dart';

class NewsModel {
  String? approvalStatus;
  String? catalogId;
  String? catalogName;
  String? code;
  bool? deleted;
  String? id;
  LastestNewsModel? latestVersion;
  int? postAt;
  int? removeAt;
  String? status;
  String? title;
  String? avatarFileUrl;
  bool? waitApproval;
  NewsModel({
    this.approvalStatus,
    this.catalogId,
    this.catalogName,
    this.code,
    this.deleted,
    this.id,
    this.latestVersion,
    this.postAt,
    this.removeAt,
    this.status,
    this.title,
    this.avatarFileUrl,
    this.waitApproval,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        approvalStatus: json['approvalStatus'] as String?,
        catalogId: json['catalogId'] as String?,
        catalogName: json['catalogName'] as String?,
        code: json['code'] as String?,
        deleted: json['deleted'] as bool?,
        id: json['id'] as String?,
        latestVersion: json['latestVersion'] == null
            ? null
            : LastestNewsModel.fromJson(json['latestVersion'] as Map<String, dynamic>),
        postAt: json['postAt'] as int?,
        removeAt: json['removeAt'] as int?,
        status: json['status'] as String?,
        title: json['title'] as String?,
        avatarFileUrl: json['avatarFileUrl'] as String?,
        waitApproval: json['waitApproval'] as bool?,
      );

  Map<String, dynamic> toJson() {
    return {
      'approvalStatus': approvalStatus,
      'catalogId': catalogId,
      'catalogName': catalogName,
      'code': code,
      'deleted': deleted,
      'id': id,
      'latestVersion': latestVersion,
      'postAt': postAt,
      'removeAt': removeAt,
      'status': status,
      'title': title,
      'avatarFileUrl': avatarFileUrl,
      'waitApproval': waitApproval,
    };
  }
}
