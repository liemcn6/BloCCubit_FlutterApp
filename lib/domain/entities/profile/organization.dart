import 'package:home_care/domain/entities/profile/contact.dart';
import 'package:home_care/domain/entities/profile/employee.dart';
import 'package:home_care/domain/entities/profile/organization_bank.dart';
import 'package:home_care/domain/entities/profile/organization_legal.dart';

class Organization {
  final List<String>? buildingIds;
  final String? businessAddress;
  final String? businessCode;
  final String? code;
  final String? commissioner;
  final String? contactAddress;
  final List<Contact>? contacts;
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? email;
  final List<Employee>? employees;
  final String? id;
  final String? identificationNumber;
  final int? incorporationDate;
  final String? institutionType;
  final String? invoiceIssuingAddress;
  final List<String>? invoiceIssuingEmails;
  final String? issuedUnit;
  final int? lastModifiedAt;
  final String? lastModifiedBy;
  final String? legalRepresentative;
  final String? name;
  final String? note;
  final List<OrganizationBank>? organizationBanks;
  final List<OrganizationLegal>? organizationLegals;
  final String? originalId;
  final String? ownerName;
  final String? parentCode;
  final String? parentId;
  final String? parentName;
  final String? partnerType;
  final String? phoneNumber;
  final String? position;
  final String? shortName;
  final String? status;
  final int? version;
  final String? website;

  Organization({
    this.buildingIds,
    this.businessAddress,
    this.businessCode,
    this.code,
    this.commissioner,
    this.contactAddress,
    this.contacts,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.email,
    this.employees,
    this.id,
    this.identificationNumber,
    this.incorporationDate,
    this.institutionType,
    this.invoiceIssuingAddress,
    this.invoiceIssuingEmails,
    this.issuedUnit,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.legalRepresentative,
    this.name,
    this.note,
    this.organizationBanks,
    this.organizationLegals,
    this.originalId,
    this.ownerName,
    this.parentCode,
    this.parentId,
    this.parentName,
    this.partnerType,
    this.phoneNumber,
    this.position,
    this.shortName,
    this.status,
    this.version,
    this.website,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        buildingIds: json["buildingIds"] == null
            ? []
            : List<String>.from(json["buildingIds"]!.map((x) => x)),
        businessAddress: json["businessAddress"],
        businessCode: json["businessCode"],
        code: json["code"],
        commissioner: json["commissioner"],
        contactAddress: json["contactAddress"],
        contacts: json["contacts"] == null
            ? []
            : List<Contact>.from(json["contacts"]!.map((x) => Contact.fromJson(x))),
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        email: json["email"],
        employees: json["employees"] == null
            ? []
            : List<Employee>.from(json["employees"]!.map((x) => Employee.fromJson(x))),
        id: json["id"],
        identificationNumber: json["identificationNumber"],
        incorporationDate: json["incorporationDate"],
        institutionType: json["institutionType"],
        invoiceIssuingAddress: json["invoiceIssuingAddress"],
        invoiceIssuingEmails: json["invoiceIssuingEmails"] == null
            ? []
            : List<String>.from(json["invoiceIssuingEmails"]!.map((x) => x)),
        issuedUnit: json["issuedUnit"],
        lastModifiedAt: json["lastModifiedAt"],
        lastModifiedBy: json["lastModifiedBy"],
        legalRepresentative: json["legalRepresentative"],
        name: json["name"],
        note: json["note"],
        organizationBanks: json["organizationBanks"] == null
            ? []
            : List<OrganizationBank>.from(
                json["organizationBanks"]!.map((x) => OrganizationBank.fromJson(x))),
        organizationLegals: json["organizationLegals"] == null
            ? []
            : List<OrganizationLegal>.from(
                json["organizationLegals"]!.map((x) => OrganizationLegal.fromJson(x))),
        originalId: json["originalId"],
        ownerName: json["ownerName"],
        parentCode: json["parentCode"],
        parentId: json["parentId"],
        parentName: json["parentName"],
        partnerType: json["partnerType"],
        phoneNumber: json["phoneNumber"],
        position: json["position"],
        shortName: json["shortName"],
        status: json["status"],
        version: json["version"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "buildingIds": buildingIds == null ? [] : List<dynamic>.from(buildingIds!.map((x) => x)),
        "businessAddress": businessAddress,
        "businessCode": businessCode,
        "code": code,
        "commissioner": commissioner,
        "contactAddress": contactAddress,
        "contacts": contacts == null ? [] : List<dynamic>.from(contacts!.map((x) => x.toJson())),
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "email": email,
        "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toJson())),
        "id": id,
        "identificationNumber": identificationNumber,
        "incorporationDate": incorporationDate,
        "institutionType": institutionType,
        "invoiceIssuingAddress": invoiceIssuingAddress,
        "invoiceIssuingEmails": invoiceIssuingEmails == null
            ? []
            : List<dynamic>.from(invoiceIssuingEmails!.map((x) => x)),
        "issuedUnit": issuedUnit,
        "lastModifiedAt": lastModifiedAt,
        "lastModifiedBy": lastModifiedBy,
        "legalRepresentative": legalRepresentative,
        "name": name,
        "note": note,
        "organizationBanks": organizationBanks == null
            ? []
            : List<dynamic>.from(organizationBanks!.map((x) => x.toJson())),
        "organizationLegals": organizationLegals == null
            ? []
            : List<dynamic>.from(organizationLegals!.map((x) => x.toJson())),
        "originalId": originalId,
        "ownerName": ownerName,
        "parentCode": parentCode,
        "parentId": parentId,
        "parentName": parentName,
        "partnerType": partnerType,
        "phoneNumber": phoneNumber,
        "position": position,
        "shortName": shortName,
        "status": status,
        "version": version,
        "website": website,
      };
}
