import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/ticket/list_ticket_queries_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/ticket/list_ticket_data_response.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/repositories/ticket/list_ticket_repo.dart';

class ListTicketRepositoryImpl extends BaseRepository with ListTicketRepo {
  @override
  Future<List<TicketItem>> getListTicket(ListTicketQueriesRequest queries) async {
    List<TicketItem> listTicket = [];
    final result = await Result.guardAsync(
      () => get(
        ApiEndpoints.listTicket,
        null,
        queries.toJson(),
      ),
    );

    result.ifSuccess((data) {
      final baseResp = BaseResponse.fromJson(data?.data);

      if (!Utils.isNullOrEmpty(baseResp.data)) {
        for (var e in baseResp.data) {
          final ticket = ListTicketDataResponse.fromJson(e);
          listTicket.add(TicketItem(
            averageRating: ticket.averageRating,
            content: ticket.content,
            dateTime: DateTimeUtils.formatDateTime(
              ticket.lastModifiedAt,
              DateTimeUtils.HH_mm_dd_MM_yyyy,
            ),
            id: ticket.id,
            status: ticket.status,
          ));
        }
      }
    });

    return listTicket;
  }
}
