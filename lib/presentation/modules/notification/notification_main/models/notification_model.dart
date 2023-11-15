import 'package:home_care/presentation/modules/home/models/files_model.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_content_model.dart';

class NotificationModel {
  final List<FilesModel>? attachFiles;
  final String? attachedLink;
  final String? content;
  final NotificationContentModel? contentJson;
  final String? contentType;
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? description;
  final String? eventId;
  final String? id;
  bool? isRead;
  final bool? isSend;
  final int? lastModifiedAt;
  final String? lastModifiedBy;
  final int? readAt;
  final int? sendAt;
  final String? status;
  final String? title;
  final String? userId;
  final int? version;

  NotificationModel({
    this.attachFiles,
    this.attachedLink,
    this.content,
    this.contentJson,
    this.contentType,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.description,
    this.eventId,
    this.id,
    this.isRead,
    this.isSend,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.readAt,
    this.sendAt,
    this.status,
    this.title,
    this.userId,
    this.version,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        attachFiles: json["attachFiles"] == null
            ? []
            : List<FilesModel>.from(json["attachFiles"]!.map((x) => FilesModel.fromJson(x))),
        attachedLink: json["attachedLink"],
        content: json["content"],
        contentJson: json["contentJson"] == null
            ? null
            : NotificationContentModel.fromJson(json["contentJson"]),
        contentType: json["contentType"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        description: json["description"],
        eventId: json["eventId"],
        id: json["id"],
        isRead: json["isRead"],
        isSend: json["isSend"],
        lastModifiedAt: json["lastModifiedAt"],
        lastModifiedBy: json["lastModifiedBy"],
        readAt: json["readAt"],
        sendAt: json["sendAt"],
        status: json["status"],
        title: json["title"],
        userId: json["userId"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "attachFiles":
            attachFiles == null ? [] : List<dynamic>.from(attachFiles!.map((x) => x.toJson())),
        "attachedLink": attachedLink,
        "content": content,
        "contentJson": contentJson?.toJson(),
        "contentType": contentType,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "description": description,
        "eventId": eventId,
        "id": id,
        "isRead": isRead,
        "isSend": isSend,
        "lastModifiedAt": lastModifiedAt,
        "lastModifiedBy": lastModifiedBy,
        "readAt": readAt,
        "sendAt": sendAt,
        "status": status,
        "title": title,
        "userId": userId,
        "version": version,
      };
}
