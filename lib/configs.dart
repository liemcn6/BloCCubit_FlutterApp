import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/data_source/remote/config_environments.dart';

import 'core/core.dart';

class AppConfigs {
  static const environment = Environments.qa;
  String environmentURL = ConfigEnvironments.getUrl();
}

class FirebaseMessagingConfig {
  static Future init() async {
    // You may set the permission requests to "provisional" which allows the user to choose what type
    // of notifications they would like to receive once the user receives a notification.
    await FirebaseMessaging.instance.requestPermission(provisional: true);

    if (Platform.isIOS) {
      // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken != null) {
        await getToken();
      }
    } else {
      await getToken();
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> getToken() async {
    // Get the token for this device
    String? token = await FirebaseMessaging.instance.getToken();
    Log.i('FCM token: $token');
    // Save the initial token to the database
    await AppSecureStorage.setFCMToken(token);
  }

  static Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // Also handle any interaction when the app is in the foreground via a
    // Stream listener
    FirebaseMessaging.onMessage.listen(_handleMessage);
  }

  static void _handleMessage(RemoteMessage message) {
    Log.i('Handling a background message ${jsonEncode(message.toMap())}');
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp();

    Log.i('Handling a background message ${message.messageId}');
  }
}
