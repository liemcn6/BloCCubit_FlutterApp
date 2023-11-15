import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/base_repository.dart';
import 'package:home_care/data/models/request/authentication/register_fcm_token_request.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/domain/repositories/notification/notification_repo.dart';
import 'package:home_care/presentation/modules/notification/notification_main/models/notification_model.dart';

class NotificationRepoImpl extends BaseRepository with NotificationRepo {
  List<NotificationModel> listNotification = [];

  @override
  Future<int> requestCountUnread() async {
    final res = await Result.guardAsync(() => get(ApiEndpoints.notificationCountUnread));
    int count = 0;
    await res.ifSuccess((data) {
      final data = res.data;
      final dataResponse = BaseResponse.fromJson(data?.data);
      count = dataResponse.data;
    });
    return count;
  }

  @override
  Future<void> requestDeleteNotification(String? id, int index) async {
    final res =
        await Result.guardAsync(() => post(ApiEndpoints.notificationDelete(id ?? ""), null));

    res.ifSuccess((data) {
      var list = listNotification;
      list.removeAt(index);
      return list;
    });
  }

  @override
  Future<NotificationModel> requestDetailNotification(String? eventId) async {
    NotificationModel notificationDetail = NotificationModel();
    final res = await Result.guardAsync(() => get(ApiEndpoints.notificationDetail(eventId ?? "")));
    res.ifSuccess((data) {
      final data = res.data;
      final dataResponse = BaseResponse.fromJson(data?.data);
      notificationDetail = NotificationModel.fromJson(dataResponse.data);
    });
    return notificationDetail;
  }

  @override
  Future<List<NotificationModel>> requestNotification(int? pageSize, int? pageIndex) async {
    List<NotificationModel> notificationList = [];
    NotificationModel notificationModel = NotificationModel();
    final res = await Result.guardAsync(
        () => get(ApiEndpoints.notification(pageSize ?? 30, pageIndex ?? 1)));

    res.ifSuccess((data) {
      final data = res.data;
      final dataResponse = BaseResponse.fromJson(data?.data);

      if (dataResponse.data is List) {
        for (var e in dataResponse.data) {
          notificationModel = NotificationModel.fromJson(e);
          notificationList.add(notificationModel);
        }
      }
    });

    return notificationList;
  }

  @override
  Future<void> requestReadNotification(String? id) async {
    final res = await Result.guardAsync(() => post(ApiEndpoints.notificationRead(id ?? ""), null));
    res.ifSuccess((data) => null);
  }

  @override
  Future<bool> requestRegisterTokenFireBase(String? token) async {
    RegisterFCMTokenRequest body = RegisterFCMTokenRequest();

    if (Platform.isAndroid) {
      final deviceInfo = getIt.get<AndroidDeviceInfo>();

      body = RegisterFCMTokenRequest(
        appVersion: deviceInfo.version.codename,
        deviceId: deviceInfo.id,
        deviceInfo: deviceInfo.hardware,
        deviceToken: token,
        deviceType: "ANDROID",
        name: deviceInfo.model,
      );
    }

    if (Platform.isIOS) {
      final deviceInfo = getIt.get<IosDeviceInfo>();

      body = RegisterFCMTokenRequest(
        appVersion: deviceInfo.systemVersion,
        deviceId: deviceInfo.identifierForVendor,
        deviceInfo: deviceInfo.model,
        deviceToken: token,
        deviceType: "IOS",
        name: deviceInfo.name,
      );
    }

    final result = await Result.guardAsync(() => post(ApiEndpoints.registerTokenFireBase, body));

    return result.isSuccess;
  }
}
