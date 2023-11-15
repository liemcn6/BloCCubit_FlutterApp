import 'package:home_care/domain/repositories/notification/notification_repo.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_model.dart';

class NotificationUseCase {
  final NotificationRepo _repo;

  NotificationUseCase(this._repo);

  Future<List<NotificationModel>> requestNotification(int? pageSize, int? pageIndex) async {
    return await _repo.requestNotification(pageSize, pageIndex);
  }

  Future<void> requestDeleteNotification(String? id, int index) async {
    return await _repo.requestDeleteNotification(id, index);
  }

  Future<void> requestReadNotification(String? id) async {
    return await _repo.requestReadNotification(id);
  }

  Future<NotificationModel> requestDetailNotification(String? eventId) async {
    return await _repo.requestDetailNotification(eventId);
  }

  Future<int> requestCountUnread() async {
    return await _repo.requestCountUnread();
  }

  Future<bool> requestRegisterTokenFireBase(String? token) async {
    return await _repo.requestRegisterTokenFireBase(token);
  }
}
