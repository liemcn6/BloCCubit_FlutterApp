class SignOutRequest {
  String deviceId;
  String deviceToken;
  String refreshToken;
  String? ssoAccessToken;
  String? ssoRefreshToken;
  String? type;

  SignOutRequest({
    required this.deviceId,
    required this.deviceToken,
    required this.refreshToken,
    this.ssoAccessToken,
    this.ssoRefreshToken,
    this.type,
  });

  factory SignOutRequest.fromJson(Map<String, dynamic> json) {
    return SignOutRequest(
      deviceId: json['deviceId'],
      deviceToken: json['deviceToken'],
      refreshToken: json['refreshToken'],
      ssoAccessToken: json['ssoAccessToken'],
      ssoRefreshToken: json['ssoRefreshToken'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'deviceToken': deviceToken,
      'refreshToken': refreshToken,
      'ssoAccessToken': ssoAccessToken,
      'ssoRefreshToken': ssoRefreshToken,
      'type': type,
    };
  }
}
