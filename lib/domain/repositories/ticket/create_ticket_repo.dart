import 'package:home_care/data/models/request/ticket/create_ticket_request.dart';

mixin CreateTicketRepo {
  Future<String?> createTicket(CreateTicketRequest data);
}
