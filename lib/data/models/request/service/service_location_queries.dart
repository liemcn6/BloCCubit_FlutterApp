class ServiceLocationQueries {
  final DateTime registrationDate;
  final int startTime;
  final int endTime;

  ServiceLocationQueries({
    required this.registrationDate,
    required this.startTime,
    required this.endTime,
  });

  factory ServiceLocationQueries.fromJson(Map<String, dynamic> json) => ServiceLocationQueries(
        registrationDate: json["registrationDate"] == null
            ? DateTime.now()
            : DateTime.parse(json["registrationDate"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "registrationDate":
            "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
        "startTime": startTime,
        "endTime": endTime,
      };
}
