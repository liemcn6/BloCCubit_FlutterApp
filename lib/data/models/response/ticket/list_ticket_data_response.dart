import 'package:home_care/data/models/response/ticket/complaint_response.dart';
import 'package:home_care/data/models/response/ticket/illustration_file_response.dart';
import 'package:home_care/data/models/response/ticket/issue_link_response.dart';
import 'package:home_care/data/models/response/ticket/review_response.dart';
import 'package:home_care/data/models/response/ticket/status_history_response.dart';
import 'package:home_care/data/models/response/ticket/ticket_location_response.dart';

class ListTicketDataResponse {
  String? createdBy;
  int? createdAt;
  String? lastModifiedBy;
  int? lastModifiedAt;
  double? averageRating;
  String? id;
  String? code;
  String? content;
  String? note;
  String? feedback;
  String? issuedUserId;
  String? issuedUserName;
  String? receivedUserId;
  String? receivedUserName;
  String? assigneeUserId;
  String? assigneeUserName;
  String? status;
  String? statusName;
  String? serviceType;
  String? serviceName;
  String? handleDepartment;
  String? buildingId;
  String? floorId;
  String? floorName;
  String? organizationId;
  String? buildingName;
  String? buildingCode;
  String? organizationName;
  bool? deleted;
  int? expectedFinishAt;
  List<IllustrationsFileResponse>? illustrationsFiles;
  List<IllustrationsFileResponse>? inspectionFiles;
  List<StatusHistoryResponse>? statusHistories;
  int? closedAt;
  ComplaintResponse? complaint;
  String? ticketType;
  String? title;
  String? unitId;
  String? unitName;
  ReviewResponse? review;
  String? priorityLevelId;
  String? priorityLevelName;
  int? priorityLevel;
  int? expectedReceiveAt;
  String? assigneeUserFullName;
  String? issuedUserFullName;
  String? confirmationNote;
  List<IllustrationsFileResponse>? confirmationFiles;
  List<TicketLocationResponse>? ticketLocations;
  List<IssueLinkResponse>? issueLinks;
  String? parentId;
  String? parentCode;

  ListTicketDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.averageRating,
    this.id,
    this.code,
    this.content,
    this.note,
    this.feedback,
    this.issuedUserId,
    this.issuedUserName,
    this.receivedUserId,
    this.receivedUserName,
    this.assigneeUserId,
    this.assigneeUserName,
    this.status,
    this.statusName,
    this.serviceType,
    this.serviceName,
    this.handleDepartment,
    this.buildingId,
    this.floorId,
    this.floorName,
    this.organizationId,
    this.buildingName,
    this.buildingCode,
    this.organizationName,
    this.deleted,
    this.expectedFinishAt,
    this.illustrationsFiles,
    this.inspectionFiles,
    this.statusHistories,
    this.closedAt,
    this.complaint,
    this.ticketType,
    this.title,
    this.unitId,
    this.unitName,
    this.review,
    this.priorityLevelId,
    this.priorityLevelName,
    this.priorityLevel,
    this.expectedReceiveAt,
    this.assigneeUserFullName,
    this.issuedUserFullName,
    this.confirmationNote,
    this.confirmationFiles,
    this.ticketLocations,
    this.issueLinks,
    this.parentId,
    this.parentCode,
  });

  factory ListTicketDataResponse.fromJson(Map<String, dynamic> json) => ListTicketDataResponse(
        createdBy: json['createdBy'],
        createdAt: json['createdAt'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedAt: json['lastModifiedAt'],
        averageRating: json['averageRating'],
        id: json['id'],
        code: json['code'],
        content: json['content'],
        note: json['note'],
        feedback: json['feedback'],
        issuedUserId: json['issuedUserId'],
        issuedUserName: json['issuedUserName'],
        receivedUserId: json['receivedUserId'],
        receivedUserName: json['receivedUserName'],
        assigneeUserId: json['assigneeUserId'],
        assigneeUserName: json['assigneeUserName'],
        status: json['status'],
        statusName: json['statusName'],
        serviceType: json['serviceType'],
        serviceName: json['serviceName'],
        handleDepartment: json['handleDepartment'],
        buildingId: json['buildingId'],
        floorId: json['floorId'],
        floorName: json['floorName'],
        organizationId: json['organizationId'],
        buildingName: json['buildingName'],
        buildingCode: json['buildingCode'],
        organizationName: json['organizationName'],
        deleted: json['deleted'],
        expectedFinishAt: json['expectedFinishAt'],
        illustrationsFiles: json['illustrationsFiles'] != null
            ? List<IllustrationsFileResponse>.from(
                json['illustrationsFiles'].map((x) => IllustrationsFileResponse.fromJson(x)))
            : null,
        inspectionFiles: json['inspectionFiles'] != null
            ? List<IllustrationsFileResponse>.from(
                json['inspectionFiles'].map((x) => IllustrationsFileResponse.fromJson(x)))
            : null,
        statusHistories: json['statusHistories'] != null
            ? List<StatusHistoryResponse>.from(
                json['statusHistories'].map((x) => StatusHistoryResponse.fromJson(x)))
            : null,
        closedAt: json['closedAt'],
        complaint: json['complaint'] != null ? ComplaintResponse.fromJson(json['complaint']) : null,
        ticketType: json['ticketType'],
        title: json['title'],
        unitId: json['unitId'],
        unitName: json['unitName'],
        review: json['review'] != null ? ReviewResponse.fromJson(json['review']) : null,
        priorityLevelId: json['priorityLevelId'],
        priorityLevelName: json['priorityLevelName'],
        priorityLevel: json['priorityLevel'],
        expectedReceiveAt: json['expectedReceiveAt'],
        assigneeUserFullName: json['assigneeUserFullName'],
        issuedUserFullName: json['issuedUserFullName'],
        confirmationNote: json['confirmationNote'],
        confirmationFiles: json['confirmationFiles'] != null
            ? List<IllustrationsFileResponse>.from(
                json['confirmationFiles'].map((x) => IllustrationsFileResponse.fromJson(x)))
            : null,
        ticketLocations: json['ticketLocations'] != null
            ? List<TicketLocationResponse>.from(
                json['ticketLocations'].map((x) => TicketLocationResponse.fromJson(x)))
            : null,
        issueLinks: json['issueLinks'] != null
            ? List<IssueLinkResponse>.from(
                json['issueLinks'].map((x) => IssueLinkResponse.fromJson(x)))
            : null,
        parentId: json['parentId'],
        parentCode: json['parentCode'],
      );

  Map<String, dynamic> toJson() => {
        'createdBy': createdBy,
        'createdAt': createdAt,
        'lastModifiedBy': lastModifiedBy,
        'lastModifiedAt': lastModifiedAt,
        'averageRating': averageRating,
        'id': id,
        'code': code,
        'content': content,
        'note': note,
        'feedback': feedback,
        'issuedUserId': issuedUserId,
        'issuedUserName': issuedUserName,
        'receivedUserId': receivedUserId,
        'receivedUserName': receivedUserName,
        'assigneeUserId': assigneeUserId,
        'assigneeUserName': assigneeUserName,
        'status': status,
        'statusName': statusName,
        'serviceType': serviceType,
        'serviceName': serviceName,
        'handleDepartment': handleDepartment,
        'buildingId': buildingId,
        'floorId': floorId,
        'floorName': floorName,
        'organizationId': organizationId,
        'buildingName': buildingName,
        'buildingCode': buildingCode,
        'organizationName': organizationName,
        'deleted': deleted,
        'expectedFinishAt': expectedFinishAt,
        'illustrationsFiles': illustrationsFiles != null
            ? List<dynamic>.from(illustrationsFiles!.map((x) => x.toJson()))
            : null,
        'inspectionFiles': inspectionFiles != null
            ? List<dynamic>.from(inspectionFiles!.map((x) => x.toJson()))
            : null,
        'statusHistories': statusHistories != null
            ? List<dynamic>.from(statusHistories!.map((x) => x.toJson()))
            : null,
        'closedAt': closedAt,
        'complaint': complaint != null ? complaint!.toJson() : null,
        'ticketType': ticketType,
        'title': title,
        'unitId': unitId,
        'unitName': unitName,
        'review': review != null ? review!.toJson() : null,
        'priorityLevelId': priorityLevelId,
        'priorityLevelName': priorityLevelName,
        'priorityLevel': priorityLevel,
        'expectedReceiveAt': expectedReceiveAt,
        'assigneeUserFullName': assigneeUserFullName,
        'issuedUserFullName': issuedUserFullName,
        'confirmationNote': confirmationNote,
        'confirmationFiles': confirmationFiles != null
            ? List<dynamic>.from(confirmationFiles!.map((x) => x.toJson()))
            : null,
        'ticketLocations': ticketLocations != null
            ? List<dynamic>.from(ticketLocations!.map((x) => x.toJson()))
            : null,
        'issueLinks':
            issueLinks != null ? List<dynamic>.from(issueLinks!.map((x) => x.toJson())) : null,
        'parentId': parentId,
        'parentCode': parentCode,
      };
}
