import 'package:home_care/data/models/request/ticket/list_ticket_queries_request.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/repositories/ticket/list_ticket_repo.dart';

class ListTicketUseCase {
  final ListTicketRepo _ticketRepository;

  ListTicketUseCase(this._ticketRepository);

  Future<List<TicketItem>> getListTicket(ListTicketQueriesRequest queries) async {
    return await _ticketRepository.getListTicket(queries);
  }
}
