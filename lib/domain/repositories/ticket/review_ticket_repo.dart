import 'package:home_care/data/models/request/ticket/review_ticket_request.dart';

mixin ReviewTicketRepo {
  Future<bool> reviewTicket(String id, ReviewTicketRequest params);
}
