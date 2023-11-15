import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/ticket/review_ticket_request.dart';
import 'package:home_care/domain/repositories/ticket/review_ticket_repo.dart';

class ReviewTicketRepoImpl extends BaseRepository with ReviewTicketRepo {
  @override
  Future<bool> reviewTicket(String id, ReviewTicketRequest params) async {
    bool isDone = false;

    final path = StringUtils.replacePathParams(ApiEndpoints.reviewTicket, {"id": id});
    final result = await Result.guardAsync(() => post(path, params));

    if (result.isSuccess) {
      isDone = true;
    }
    return isDone;
  }
}
