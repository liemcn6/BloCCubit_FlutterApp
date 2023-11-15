class LoginDataResponse {
  String? accessToken;
  int? expiresIn;
  String? idToken;
  String? refreshToken;
  String? secretKey;
  String? tokenType;

  LoginDataResponse({
    this.accessToken,
    this.expiresIn,
    this.idToken,
    this.refreshToken,
    this.secretKey,
    this.tokenType,
  });

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) => LoginDataResponse(
        accessToken: json["accessToken"],
        expiresIn: json["expiresIn"],
        idToken: json["idToken"],
        refreshToken: json["refreshToken"],
        secretKey: json["secretKey"],
        tokenType: json["tokenType"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "expiresIn": expiresIn,
        "idToken": idToken,
        "refreshToken": refreshToken,
        "secretKey": secretKey,
        "tokenType": tokenType,
      };

  LoginDataResponse copyWith({
    String? accessToken,
    int? expiresIn,
    String? idToken,
    String? refreshToken,
    String? secretKey,
    String? tokenType,
  }) {
    return LoginDataResponse(
      accessToken: accessToken ?? this.accessToken,
      expiresIn: expiresIn ?? this.expiresIn,
      idToken: idToken ?? this.idToken,
      refreshToken: refreshToken ?? this.refreshToken,
      secretKey: secretKey ?? this.secretKey,
      tokenType: tokenType ?? this.tokenType,
    );
  }
}
