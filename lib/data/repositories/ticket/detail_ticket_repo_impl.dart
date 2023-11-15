import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/ticket/update_ticket_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/ticket/list_ticket_data_response.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/repositories/ticket/detail_ticket_repo.dart';

class DetailTicketRepoImpl extends BaseRepository with DetailTicketRepo {
  @override
  Future<TicketItem?> getDetailTicket(String id) async {
    final result = await Result.guardAsync(
      () => get(
        StringUtils.replacePathParams(ApiEndpoints.detailTicket, {'id': id}),
      ),
    );

    if (result.isSuccess) {
      final baseResponse = BaseResponse.fromJson(result.data?.data);
      final ticket = ListTicketDataResponse.fromJson(baseResponse.data);
      return TicketItem(
        averageRating: ticket.averageRating,
        content: ticket.content,
        dateTime: DateTimeUtils.formatDateTime(
          ticket.lastModifiedAt,
          DateTimeUtils.HH_mm_dd_MM_yyyy,
        ),
        id: ticket.id,
        status: ticket.status,
        confirmationNote: ticket.confirmationNote,
        issueLinks: ticket.issueLinks,
        parentCode: ticket.parentCode,
        parentId: ticket.parentId,
        assigneeUserId: ticket.assigneeUserId,
        assigneeUserName: ticket.assigneeUserName,
        buildingCode: ticket.buildingCode,
        buildingId: ticket.buildingId,
        buildingName: ticket.buildingName,
        confirmationFiles: ticket.confirmationFiles,
        feedback: ticket.feedback,
        illustrationsFiles: ticket.illustrationsFiles,
        inspectionFiles: ticket.inspectionFiles,
        issuedUserId: ticket.issuedUserId,
        issuedUserName: ticket.issuedUserName,
        note: ticket.note,
        organizationId: ticket.organizationId,
        organizationName: ticket.organizationName,
        receivedUserId: ticket.receivedUserId,
        receivedUserName: ticket.receivedUserName,
        serviceType: ticket.serviceType,
        ticketLocations: ticket.ticketLocations,
        review: ticket.review,
      );
    }

    return null;
  }

  @override
  Future<bool> updateTicket(UpdateTicketRequest data) async {
    final result = await Result.guardAsync(
      () => post(
        StringUtils.replacePathParams(ApiEndpoints.updateDraftTicket, {"id": data.id ?? ''}),
        data,
      ),
    );

    if (result.isSuccess) {
      final baseResponse = BaseResponse.fromJson(result.data?.data);
      return baseResponse.success ?? false;
    }

    return false;
  }
}
