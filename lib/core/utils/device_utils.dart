part of '../core.dart';

class DeviceUtils {
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static Size getSize(BuildContext context) => MediaQuery.of(context).size;

  static getStatusBarHeight(BuildContext context) => MediaQuery.of(context).viewPadding.top;

  static double getHeight3(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    return MediaQuery.of(context).size.height - padding.top - kToolbarHeight;
  }

  static Future<String?> getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      const androidIdPlugin = AndroidId();
      return await androidIdPlugin.getId();
    }
    return null;
  }
}
