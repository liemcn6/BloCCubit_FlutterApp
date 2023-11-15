class ProfileEditResponse {
  String? avatarFileId;
  String? dayOfBirth;
  String? description;
  String? email;
  String? fullName;
  String? gender;
  String? phoneNumber;

  ProfileEditResponse(
      {this.avatarFileId,
      this.dayOfBirth,
      this.description,
      this.email,
      this.fullName,
      this.gender,
      this.phoneNumber});

  factory ProfileEditResponse.fromJson(Map<String, dynamic> json) => ProfileEditResponse(
        avatarFileId: json['avatarFileId'] as String?,
        dayOfBirth: json['dayOfBirth'] as String?,
        description: json['description'] as String?,
        email: json['email'] as String?,
        fullName: json['fullName'] as String?,
        gender: json['gender'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'avatarFileId': avatarFileId,
        'dayOfBirth': dayOfBirth,
        'description': description,
        'email': email,
        'fullName': fullName,
        'gender': gender,
        'phoneNumber': phoneNumber,
      };
}
