class ChangePasswordRequest {
  String? newPassword;
  String? oldPassword;
  String? refreshToken;

  ChangePasswordRequest({this.newPassword, this.oldPassword, this.refreshToken});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => ChangePasswordRequest(
        newPassword: json['newPassword'] as String?,
        oldPassword: json['oldPassword'] as String?,
        refreshToken: json['refreshToken'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'newPassword': newPassword,
        'oldPassword': oldPassword,
        'refreshToken': refreshToken,
      };
}
