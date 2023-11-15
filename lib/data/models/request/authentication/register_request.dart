class RegisterRequest {
  final String fullName;
  final String? gender;
  final String? phoneNumber;
  final String? email;
  final String username;
  final String password;

  const RegisterRequest({
    this.email,
    required this.fullName,
    this.gender,
    required this.password,
    this.phoneNumber,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'fullName': fullName,
        'username': username,
        'password': password,
      };
}
