class ServiceRegistrationBody {
  final String? facilityGroupId;
  final String? facilityId;
  final String? facilityOptionId;
  final DateTime? registrationDate;
  final String? note;

  ServiceRegistrationBody({
    this.facilityGroupId,
    this.facilityId,
    this.facilityOptionId,
    this.registrationDate,
    this.note,
  });

  factory ServiceRegistrationBody.fromJson(Map<String, dynamic> json) => ServiceRegistrationBody(
        facilityGroupId: json["facilityGroupId"],
        facilityId: json["facilityId"],
        facilityOptionId: json["facilityOptionId"],
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "facilityGroupId": facilityGroupId,
        "facilityId": facilityId,
        "facilityOptionId": facilityOptionId,
        "registrationDate":
            "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "note": note,
      };
}
