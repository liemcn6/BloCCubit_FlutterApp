import 'package:home_care/data/models/request/ticket/list_ticket_queries_request.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';

mixin ListTicketRepo {
  Future<List<TicketItem>> getListTicket(ListTicketQueriesRequest queries);
}
