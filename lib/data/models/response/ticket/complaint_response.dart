import 'package:home_care/data/models/response/ticket/illustration_file_response.dart';
import 'package:home_care/data/models/response/ticket/status_history_response.dart';

class ComplaintResponse {
  String? buildingCode;
  String? buildingId;
  String? buildingName;
  int? closedAt;
  String? closedNote;
  String? closedUserId;
  String? closedUserName;
  String? code;
  List<IllustrationsFileResponse>? complaintFiles;
  String? complaintTemplateId;
  String? complaintType;
  String? content;
  int? createdAt;
  String? createdBy;
  bool? deleted;
  String? email;
  String? feedback;
  String? floorId;
  String? floorName;
  String? fullName;
  String? id;
  String? invalidReason;
  int? lastModifiedAt;
  String? lastModifiedBy;
  String? phoneNumber;
  String? receivedUserId;
  String? receivedUserName;
  bool? satisfied;
  String? status;
  List<StatusHistoryResponse>? statusHistories;
  String? ticket;
  String? ticketId;
  String? title;

  ComplaintResponse({
    this.buildingCode,
    this.buildingId,
    this.buildingName,
    this.closedAt,
    this.closedNote,
    this.closedUserId,
    this.closedUserName,
    this.code,
    this.complaintFiles,
    this.complaintTemplateId,
    this.complaintType,
    this.content,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.email,
    this.feedback,
    this.floorId,
    this.floorName,
    this.fullName,
    this.id,
    this.invalidReason,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.phoneNumber,
    this.receivedUserId,
    this.receivedUserName,
    this.satisfied,
    this.status,
    this.statusHistories,
    this.ticket,
    this.ticketId,
    this.title,
  });

  factory ComplaintResponse.fromJson(Map<String, dynamic> json) => ComplaintResponse(
        buildingCode: json['buildingCode'],
        buildingId: json['buildingId'],
        buildingName: json['buildingName'],
        closedAt: json['closedAt'],
        closedNote: json['closedNote'],
        closedUserId: json['closedUserId'],
        closedUserName: json['closedUserName'],
        code: json['code'],
        complaintFiles: json['complaintFiles'] != null
            ? (json['complaintFiles'] as List)
                .map((i) => IllustrationsFileResponse.fromJson(i))
                .toList()
            : null,
        complaintTemplateId: json['complaintTemplateId'],
        complaintType: json['complaintType'],
        content: json['content'],
        createdAt: json['createdAt'],
        createdBy: json['createdBy'],
        deleted: json['deleted'],
        email: json['email'],
        feedback: json['feedback'],
        floorId: json['floorId'],
        floorName: json['floorName'],
        fullName: json['fullName'],
        id: json['id'],
        invalidReason: json['invalidReason'],
        lastModifiedAt: json['lastModifiedAt'],
        lastModifiedBy: json['lastModifiedBy'],
        phoneNumber: json['phoneNumber'],
        receivedUserId: json['receivedUserId'],
        receivedUserName: json['receivedUserName'],
        satisfied: json['satisfied'],
        status: json['status'],
        statusHistories: json['statusHistories'] != null
            ? (json['statusHistories'] as List)
                .map((i) => StatusHistoryResponse.fromJson(i))
                .toList()
            : null,
        ticket: json['ticket'],
        ticketId: json['ticketId'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['buildingCode'] = buildingCode;
    data['buildingId'] = buildingId;
    data['buildingName'] = buildingName;
    data['closedAt'] = closedAt;
    data['closedNote'] = closedNote;
    data['closedUserId'] = closedUserId;
    data['closedUserName'] = closedUserName;
    data['code'] = code;
    if (complaintFiles != null) {
      data['complaintFiles'] = complaintFiles!.map((v) => v.toJson()).toList();
    }
    data['complaintTemplateId'] = complaintTemplateId;
    data['complaintType'] = complaintType;
    data['content'] = content;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    data['deleted'] = deleted;
    data['email'] = email;
    data['feedback'] = feedback;
    data['floorId'] = floorId;
    data['floorName'] = floorName;
    data['fullName'] = fullName;
    data['id'] = id;
    data['invalidReason'] = invalidReason;
    data['lastModifiedAt'] = lastModifiedAt;
    data['lastModifiedBy'] = lastModifiedBy;
    data['phoneNumber'] = phoneNumber;
    data['receivedUserId'] = receivedUserId;
    data['receivedUserName'] = receivedUserName;
    data['satisfied'] = satisfied;
    data['status'] = status;
    if (statusHistories != null) {
      data['statusHistories'] = statusHistories!.map((v) => v.toJson()).toList();
    }
    data['ticket'] = ticket;
    data['ticketId'] = ticketId;
    data['title'] = title;
    return data;
  }
}
