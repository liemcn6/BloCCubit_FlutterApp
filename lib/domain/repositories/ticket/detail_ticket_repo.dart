import 'package:home_care/data/models/request/ticket/update_ticket_request.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';

mixin DetailTicketRepo {
  Future<TicketItem?> getDetailTicket(String id);
  Future<bool> updateTicket(UpdateTicketRequest data);
}
