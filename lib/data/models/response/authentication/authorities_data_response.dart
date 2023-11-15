class AuthoritiesDataResponse {
  String? accountType;
  List<String>? buildingIds;
  String? employeeId;
  List<String>? grantedPermissions;
  bool? isRoot;
  int? lastAuthChangeAt;
  String? organizationId;
  String? userId;
  String? userLevel;

  AuthoritiesDataResponse({
    this.accountType,
    this.buildingIds,
    this.employeeId,
    this.grantedPermissions,
    this.isRoot,
    this.lastAuthChangeAt,
    this.organizationId,
    this.userId,
    this.userLevel,
  });

  factory AuthoritiesDataResponse.fromJson(Map<String, dynamic> json) => AuthoritiesDataResponse(
        accountType: json["accountType"],
        buildingIds: json["buildingIds"] == null
            ? null
            : List<String>.from(json["buildingIds"].map((x) => x)),
        employeeId: json["employeeId"],
        grantedPermissions: json["grantedPermissions"] == null
            ? null
            : List<String>.from(json["grantedPermissions"].map((x) => x)),
        isRoot: json["isRoot"],
        lastAuthChangeAt: json["lastAuthChangeAt"],
        organizationId: json["organizationId"],
        userId: json["userId"],
        userLevel: json["userLevel"],
      );

  Map<String, dynamic> toJson() => {
        "accountType": accountType,
        "buildingIds": List<dynamic>.from(buildingIds!.map((x) => x)),
        "employeeId": employeeId,
        "grantedPermissions": List<dynamic>.from(grantedPermissions!.map((x) => x)),
        "isRoot": isRoot,
        "lastAuthChangeAt": lastAuthChangeAt,
        "organizationId": organizationId,
        "userId": userId,
        "userLevel": userLevel,
      };
}
