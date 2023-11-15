import 'package:equatable/equatable.dart';
import 'package:home_care/domain/entities/profile/organization.dart';

class UserProfile extends Equatable {
  final String? id;
  final String? username;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? accountType;
  final String? dayOfBirth;
  final String? avatarFileUrl;
  final String? avatarFileId;
  final Organization? organization;
  final String? address;

  const UserProfile({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.accountType,
    this.dayOfBirth,
    this.avatarFileUrl,
    this.avatarFileId,
    this.organization,
    this.address,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"] as String?,
        username: json["username"] as String?,
        fullName: json["fullName"] as String?,
        email: json["email"] as String?,
        phoneNumber: json["phoneNumber"] as String?,
        gender: json["gender"] as String?,
        accountType: json["accountType"] as String?,
        dayOfBirth: json["dayOfBirth"] as String?,
        avatarFileUrl: json["avatarFileUrl"] as String?,
        avatarFileId: json["avatarFileId"] as String?,
        organization:
            json["organization"] == null ? null : Organization.fromJson(json["organization"]),
        address: json["address"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "accountType": accountType,
        "dayOfBirth": dayOfBirth,
        "avatarFileUrl": avatarFileUrl,
        "avatarFileId": avatarFileId,
        "organization": organization?.toJson(),
        "address": address,
      };

  @override
  List<Object?> get props => [
        id,
        username,
        fullName,
        email,
        phoneNumber,
        gender,
        accountType,
        dayOfBirth,
        avatarFileUrl,
        avatarFileId,
        organization,
        address,
      ];
}
