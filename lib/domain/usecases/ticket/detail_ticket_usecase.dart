import 'package:home_care/data/models/request/ticket/update_ticket_request.dart';
import 'package:home_care/domain/entities/ticket/ticket_item.dart';
import 'package:home_care/domain/repositories/ticket/detail_ticket_repo.dart';

class DetailTicketUseCase {
  final DetailTicketRepo _repository;

  DetailTicketUseCase(this._repository);

  Future<TicketItem?> getDetailTicket(String id) async {
    return await _repository.getDetailTicket(id);
  }

  Future<bool> updateTicket(UpdateTicketRequest data) async {
    return await _repository.updateTicket(data);
  }
}
