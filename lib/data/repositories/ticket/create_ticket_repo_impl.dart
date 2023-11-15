import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/ticket/create_ticket_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/data/models/response/ticket/list_ticket_data_response.dart';
import 'package:home_care/domain/repositories/ticket/create_ticket_repo.dart';

class CreateTicketRepoImpl extends BaseRepository with CreateTicketRepo {
  @override
  Future<String?> createTicket(CreateTicketRequest data) async {
    String? status;
    final result = await Result.guardAsync(() => post(ApiEndpoints.crateTicket, data));

    result.ifSuccess((data) {
      final res = BaseResponse.fromJson(data?.data);
      final ticket = ListTicketDataResponse.fromJson(res.data);

      status = ticket.status;
    });

    return status;
  }
}
