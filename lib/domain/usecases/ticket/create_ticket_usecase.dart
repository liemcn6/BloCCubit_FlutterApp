import 'package:home_care/data/models/request/ticket/create_ticket_request.dart';
import 'package:home_care/domain/repositories/ticket/create_ticket_repo.dart';

class CreateTicketUseCase {
  final CreateTicketRepo _repository;

  CreateTicketUseCase(this._repository);

  Future<String?> createTicket(CreateTicketRequest data) async {
    return await _repository.createTicket(data);
  }
}
