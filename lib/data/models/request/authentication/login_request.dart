import 'dart:convert';

class LoginRequest {
  String password;
  String username;
  bool rememberMe;

  LoginRequest({
    required this.username,
    required this.password,
    this.rememberMe = true,
  });

  factory LoginRequest.fromRawJson(String str) => LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        password: json["password"],
        username: json["username"],
        rememberMe: json["rememberMe"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "username": username,
        "rememberMe": rememberMe,
      };
}
