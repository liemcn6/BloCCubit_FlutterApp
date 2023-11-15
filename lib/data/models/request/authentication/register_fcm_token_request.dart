class RegisterFCMTokenRequest {
  final String? appVersion;
  final String? deviceId;
  final String? deviceInfo;
  final String? deviceToken;
  final String? deviceType;
  final String? name;

  RegisterFCMTokenRequest({
    this.appVersion,
    this.deviceId,
    this.deviceInfo,
    this.deviceToken,
    this.deviceType,
    this.name,
  });

  factory RegisterFCMTokenRequest.fromJson(Map<String, dynamic> json) => RegisterFCMTokenRequest(
        appVersion: json["appVersion"],
        deviceId: json["deviceId"],
        deviceInfo: json["deviceInfo"],
        deviceToken: json["deviceToken"],
        deviceType: json["deviceType"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "appVersion": appVersion,
        "deviceId": deviceId,
        "deviceInfo": deviceInfo,
        "deviceToken": deviceToken,
        "deviceType": deviceType,
        "name": name,
      };
}
