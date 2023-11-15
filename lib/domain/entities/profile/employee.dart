import 'package:home_care/domain/entities/building/building.dart';
import 'package:home_care/domain/entities/profile/user_location.dart';

class Employee {
  final String? avatarFileId;
  final List<Building>? buildings;
  final String? contactAddress;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? dayOfBirth;
  final bool? deleted;
  final int? height;
  final String? id;
  final String? identificationNumber;
  final DateTime? lastModifiedAt;
  final String? lastModifiedBy;
  final String? name;
  final String? organizationId;
  final String? phoneNumber;
  final String? position;
  final DateTime? startWorkingDate;
  final String? title;
  final String? userId;
  final List<UserLocation>? userLocations;
  final int? weight;

  Employee({
    this.avatarFileId,
    this.buildings,
    this.contactAddress,
    this.createdAt,
    this.createdBy,
    this.dayOfBirth,
    this.deleted,
    this.height,
    this.id,
    this.identificationNumber,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.name,
    this.organizationId,
    this.phoneNumber,
    this.position,
    this.startWorkingDate,
    this.title,
    this.userId,
    this.userLocations,
    this.weight,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        avatarFileId: json["avatarFileId"],
        buildings: json["buildings"] == null
            ? []
            : List<Building>.from(json["buildings"]!.map((x) => Building.fromJson(x))),
        contactAddress: json["contactAddress"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        createdBy: json["createdBy"],
        dayOfBirth: json["dayOfBirth"] == null ? null : DateTime.parse(json["dayOfBirth"]),
        deleted: json["deleted"],
        height: json["height"],
        id: json["id"],
        identificationNumber: json["identificationNumber"],
        lastModifiedAt:
            json["lastModifiedAt"] == null ? null : DateTime.parse(json["lastModifiedAt"]),
        lastModifiedBy: json["lastModifiedBy"],
        name: json["name"],
        organizationId: json["organizationId"],
        phoneNumber: json["phoneNumber"],
        position: json["position"],
        startWorkingDate:
            json["startWorkingDate"] == null ? null : DateTime.parse(json["startWorkingDate"]),
        title: json["title"],
        userId: json["userId"],
        userLocations: json["userLocations"] == null
            ? []
            : List<UserLocation>.from(json["userLocations"]!.map((x) => UserLocation.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "avatarFileId": avatarFileId,
        "buildings": buildings == null ? [] : List<dynamic>.from(buildings!.map((x) => x.toJson())),
        "contactAddress": contactAddress,
        "createdAt": createdAt?.toIso8601String(),
        "createdBy": createdBy,
        "dayOfBirth":
            "${dayOfBirth!.year.toString().padLeft(4, '0')}-${dayOfBirth!.month.toString().padLeft(2, '0')}-${dayOfBirth!.day.toString().padLeft(2, '0')}",
        "deleted": deleted,
        "height": height,
        "id": id,
        "identificationNumber": identificationNumber,
        "lastModifiedAt": lastModifiedAt?.toIso8601String(),
        "lastModifiedBy": lastModifiedBy,
        "name": name,
        "organizationId": organizationId,
        "phoneNumber": phoneNumber,
        "position": position,
        "startWorkingDate":
            "${startWorkingDate!.year.toString().padLeft(4, '0')}-${startWorkingDate!.month.toString().padLeft(2, '0')}-${startWorkingDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "userId": userId,
        "userLocations":
            userLocations == null ? [] : List<dynamic>.from(userLocations!.map((x) => x.toJson())),
        "weight": weight,
      };
}
