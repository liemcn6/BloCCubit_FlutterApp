import 'package:home_care/data/models/request/ticket/review_ticket_request.dart';
import 'package:home_care/domain/repositories/ticket/review_ticket_repo.dart';

class ReviewTicketUsecase {
  final ReviewTicketRepo _repo;

  ReviewTicketUsecase(this._repo);

  Future<bool> reviewTicket(String id, ReviewTicketRequest params) async {
    return await _repo.reviewTicket(id, params);
  }
}
