import 'package:home_care/domain/entities/building/building.dart';

class Contact {
  final List<Building>? buildings;
  final int? createdAt;
  final String? createdBy;
  final int? dayOfBirth;
  final bool? deleted;
  final String? email;
  final String? fullName;
  final String? gender;
  final String? id;
  final int? lastModifiedAt;
  final String? lastModifiedBy;
  final String? organizationId;
  final String? phoneNumber;
  final String? userId;

  Contact({
    this.buildings,
    this.createdAt,
    this.createdBy,
    this.dayOfBirth,
    this.deleted,
    this.email,
    this.fullName,
    this.gender,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.organizationId,
    this.phoneNumber,
    this.userId,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        buildings: json["buildings"] == null
            ? []
            : List<Building>.from(json["buildings"]!.map((x) => Building.fromJson(x))),
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        dayOfBirth: json["dayOfBirth"],
        deleted: json["deleted"],
        email: json["email"],
        fullName: json["fullName"],
        gender: json["gender"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"],
        lastModifiedBy: json["lastModifiedBy"],
        organizationId: json["organizationId"],
        phoneNumber: json["phoneNumber"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "buildings": buildings == null ? [] : List<dynamic>.from(buildings!.map((x) => x.toJson())),
        "createdAt": createdAt,
        "createdBy": createdBy,
        "dayOfBirth": dayOfBirth,
        "deleted": deleted,
        "email": email,
        "fullName": fullName,
        "gender": gender,
        "id": id,
        "lastModifiedAt": lastModifiedAt,
        "lastModifiedBy": lastModifiedBy,
        "organizationId": organizationId,
        "phoneNumber": phoneNumber,
        "userId": userId,
      };
}
