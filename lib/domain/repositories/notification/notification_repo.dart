import 'package:home_care/presentation/modules/notification/notification_main/models/notification_model.dart';

mixin NotificationRepo {
  Future<List<NotificationModel>> requestNotification(int? pageSize, int? pageIndex);
  Future<void> requestDeleteNotification(String? id, int index);
  Future<void> requestReadNotification(String? id);
  Future<NotificationModel> requestDetailNotification(String? eventId);
  Future<int> requestCountUnread();
  Future<bool> requestRegisterTokenFireBase(String? token);
}
