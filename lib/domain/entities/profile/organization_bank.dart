class OrganizationBank {
  final String? accountNumber;
  final String? bankId;
  final String? bankName;
  final String? branch;
  final int? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? id;
  final int? lastModifiedAt;
  final String? lastModifiedBy;
  final String? organizationId;

  OrganizationBank({
    this.accountNumber,
    this.bankId,
    this.bankName,
    this.branch,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.organizationId,
  });

  factory OrganizationBank.fromJson(Map<String, dynamic> json) => OrganizationBank(
        accountNumber: json["accountNumber"],
        bankId: json["bankId"],
        bankName: json["bankName"],
        branch: json["branch"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        deleted: json["deleted"],
        id: json["id"],
        lastModifiedAt: json["lastModifiedAt"],
        lastModifiedBy: json["lastModifiedBy"],
        organizationId: json["organizationId"],
      );

  Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
        "bankId": bankId,
        "bankName": bankName,
        "branch": branch,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "deleted": deleted,
        "id": id,
        "lastModifiedAt": lastModifiedAt,
        "lastModifiedBy": lastModifiedBy,
        "organizationId": organizationId,
      };
}
