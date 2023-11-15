import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/models/response/authentication/login_data_response.dart';
import 'package:home_care/domain/entities/profile/user_profile.dart';

class AppSecureStorage {
  static const String token = 'token';
  static const String profile = 'profile';
  static const String isLocalAuthEnabled = 'isLocalAuthEnabled';
  static const String localAuthEnabledFor = 'localAuthEnabledFor';
  static const String fcmToken = 'fcmToken';
  static const String encToken = 'encToken';

  static FlutterSecureStorage init() {
    const iosOptions = IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    );
    const androidOptions = AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
    );

    return const FlutterSecureStorage(
      iOptions: iosOptions,
      aOptions: androidOptions,
    );
  }

  static Future<void> setToken(LoginDataResponse? value) async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawToken = jsonEncode(value?.toJson());

    await storage.write(key: token, value: rawToken);
  }

  static Future<LoginDataResponse?> getToken() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawToken = await storage.read(key: token);

    if (rawToken == null) {
      return null;
    }

    final Map<String, dynamic>? tokenData = jsonDecode(rawToken);

    if (tokenData == null || tokenData.isEmpty == true) {
      return null;
    }

    return LoginDataResponse.fromJson(tokenData);
  }

  static Future<void> setProfile(UserProfile? value) async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawProfile = jsonEncode(value?.toJson());
    await storage.delete(key: profile);
    await storage.write(key: profile, value: rawProfile);
  }

  static Future<UserProfile?> getProfile() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawProfile = await storage.read(key: profile);

    if (rawProfile == null) {
      return null;
    }

    final Map<String, dynamic>? profileData = jsonDecode(rawProfile);

    if (profileData == null || profileData.isEmpty == true) {
      return null;
    }

    return UserProfile.fromJson(profileData);
  }

  static Future setBiometricAuthenticate(bool biometricAuthenticate) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(key: isLocalAuthEnabled, value: biometricAuthenticate.toString());
  }

  static Future<bool> getBiometricAuthenticate() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawBiometricAuthenticate = await storage.read(key: isLocalAuthEnabled);

    if (rawBiometricAuthenticate == null) {
      return false;
    }

    return rawBiometricAuthenticate == 'true';
  }

  static Future setLocalAuthEnabledFor(String localAuthEnabledFor) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(key: localAuthEnabledFor, value: localAuthEnabledFor);
  }

  static Future<String?> getLocalAuthEnabledFor() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawLocalAuthEnabledFor = await storage.read(key: localAuthEnabledFor);

    return rawLocalAuthEnabledFor;
  }

  static Future clearToken() async {
    final tokenData = await getToken();

    // Remove refresh token
    final newToken = tokenData?.copyWith(
      refreshToken: '',
    );

    await setToken(newToken);
  }

  static Future setFCMToken(String? token) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(key: fcmToken, value: token);
  }

  static Future<String?> getFCMToken() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawFCMToken = await storage.read(key: fcmToken);

    return rawFCMToken;
  }

  static Future setEncToken(String? token) async {
    final storage = getIt.get<FlutterSecureStorage>();

    await storage.write(key: encToken, value: token);
  }

  static Future<String?> getEncToken() async {
    final storage = getIt.get<FlutterSecureStorage>();
    final rawEncToken = await storage.read(key: encToken);

    return rawEncToken;
  }
}
