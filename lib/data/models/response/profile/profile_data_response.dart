import 'package:home_care/domain/entities/profile/organization.dart';

class ProfileDataResponse {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? username;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final bool? deleted;
  final String? authenticationType;
  final String? employeeCode;
  final String? status;
  final String? userLevel;
  final String? accountType;
  final int? lastAuthChangeAt;
  final int? lastAuthAt;
  final int? lastAuthFailAt;
  final List<dynamic>? roleProperties;
  final int? version;
  final List<dynamic>? propertyOfRole;
  final String? dayOfBirth;
  final String? avatarFileUrl;
  final Organization? organization;
  final String? avatarFileId;

  ProfileDataResponse({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.deleted,
    this.authenticationType,
    this.employeeCode,
    this.status,
    this.userLevel,
    this.accountType,
    this.lastAuthChangeAt,
    this.lastAuthAt,
    this.lastAuthFailAt,
    this.roleProperties,
    this.version,
    this.propertyOfRole,
    this.dayOfBirth,
    this.avatarFileUrl,
    this.organization,
    this.avatarFileId,
  });

  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) => ProfileDataResponse(
        createdBy: json["createdBy"],
        createdAt: json["createdAt"],
        lastModifiedBy: json["lastModifiedBy"],
        lastModifiedAt: json["lastModifiedAt"],
        id: json["id"],
        username: json["username"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        deleted: json["deleted"],
        authenticationType: json["authenticationType"],
        employeeCode: json["employeeCode"],
        status: json["status"],
        userLevel: json["userLevel"],
        accountType: json["accountType"],
        lastAuthChangeAt: json["lastAuthChangeAt"],
        lastAuthAt: json["lastAuthAt"],
        lastAuthFailAt: json["lastAuthFailAt"],
        roleProperties: json["roleProperties"] == null
            ? []
            : List<dynamic>.from(json["roleProperties"]!.map((x) => x)),
        version: json["version"],
        propertyOfRole: json["propertyOfRole"] == null
            ? []
            : List<dynamic>.from(json["propertyOfRole"]!.map((x) => x)),
        dayOfBirth: json["dayOfBirth"],
        avatarFileUrl: json["avatarFileUrl"],
        organization:
            json["organization"] == null ? null : Organization.fromJson(json["organization"]),
        avatarFileId: json["avatarFileId"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "createdBy": createdBy,
        "createdAt": createdAt,
        "lastModifiedBy": lastModifiedBy,
        "lastModifiedAt": lastModifiedAt,
        "id": id,
        "username": username,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "deleted": deleted,
        "authenticationType": authenticationType,
        "employeeCode": employeeCode,
        "status": status,
        "userLevel": userLevel,
        "accountType": accountType,
        "lastAuthChangeAt": lastAuthChangeAt,
        "lastAuthAt": lastAuthAt,
        "lastAuthFailAt": lastAuthFailAt,
        "roleProperties":
            roleProperties == null ? [] : List<dynamic>.from(roleProperties!.map((x) => x)),
        "version": version,
        "propertyOfRole":
            propertyOfRole == null ? [] : List<dynamic>.from(propertyOfRole!.map((x) => x)),
        "dayOfBirth": dayOfBirth,
        "avatarFileUrl": avatarFileUrl,
        "organization": organization?.toJson(),
        "avatarFileId": avatarFileId,
      };
}
