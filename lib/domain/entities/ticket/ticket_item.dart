import 'package:equatable/equatable.dart';
import 'package:home_care/data/models/response/ticket/illustration_file_response.dart';
import 'package:home_care/data/models/response/ticket/issue_link_response.dart';
import 'package:home_care/data/models/response/ticket/review_response.dart';
import 'package:home_care/data/models/response/ticket/ticket_location_response.dart';

class TicketItem extends Equatable {
  final String? id;
  final String? content;
  final String? dateTime;
  final String? status;
  final double? averageRating;
  final List<IssueLinkResponse>? issueLinks;
  final String? parentId;
  final String? parentCode;
  final String? confirmationNote;
  final String? note;
  final String? feedback;
  final String? buildingId;
  final String? buildingName;
  final String? buildingCode;
  final List<TicketLocationResponse>? ticketLocations;
  final String? organizationId;
  final String? organizationName;
  final String? issuedUserId;
  final String? issuedUserName;
  final String? receivedUserId;
  final String? receivedUserName;
  final String? assigneeUserId;
  final String? assigneeUserName;
  final String? serviceType;
  final List<IllustrationsFileResponse>? illustrationsFiles;
  final List<IllustrationsFileResponse>? inspectionFiles;
  final List<IllustrationsFileResponse>? confirmationFiles;
  final ReviewResponse? review;

  const TicketItem({
    this.id,
    this.content,
    this.dateTime,
    this.status,
    this.averageRating,
    this.issueLinks,
    this.parentId,
    this.parentCode,
    this.confirmationNote,
    this.note,
    this.feedback,
    this.buildingId,
    this.buildingName,
    this.buildingCode,
    this.ticketLocations,
    this.organizationId,
    this.organizationName,
    this.issuedUserId,
    this.issuedUserName,
    this.receivedUserId,
    this.receivedUserName,
    this.assigneeUserId,
    this.assigneeUserName,
    this.serviceType,
    this.illustrationsFiles,
    this.inspectionFiles,
    this.confirmationFiles,
    this.review,
  });

  @override
  List<Object?> get props => [
        id,
        content,
        dateTime,
        status,
        averageRating,
        issueLinks,
        parentId,
        parentCode,
        confirmationNote,
        note,
        feedback,
        buildingId,
        buildingName,
        buildingCode,
        ticketLocations,
        organizationId,
        organizationName,
        issuedUserId,
        issuedUserName,
        receivedUserId,
        receivedUserName,
        assigneeUserId,
        assigneeUserName,
        serviceType,
        illustrationsFiles,
        inspectionFiles,
        confirmationFiles,
        review,
      ];
}
