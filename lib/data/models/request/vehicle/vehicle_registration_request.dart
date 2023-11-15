import 'package:home_care/domain/entities/file/image_model.dart';

class VehicleRegistrationRequest {
  final String? buildingId;
  final String? contractId;
  final String? issuedUserId;
  final int? month;
  final String? organizationId;
  final int? thresholdPriceDay;
  final List<VehicleCreate>? vehicleCreates;
  final int? year;

  VehicleRegistrationRequest({
    this.buildingId,
    this.contractId,
    this.issuedUserId,
    this.month,
    this.organizationId,
    this.thresholdPriceDay,
    this.vehicleCreates,
    this.year,
  });

  factory VehicleRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      VehicleRegistrationRequest(
        buildingId: json["buildingId"],
        contractId: json["contractId"],
        issuedUserId: json["issuedUserId"],
        month: json["month"],
        organizationId: json["organizationId"],
        thresholdPriceDay: json["thresholdPriceDay"],
        vehicleCreates: json["vehicleCreates"] == null
            ? []
            : List<VehicleCreate>.from(
                json["vehicleCreates"]!.map((x) => VehicleCreate.fromJson(x))),
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "buildingId": buildingId,
        "contractId": contractId,
        "issuedUserId": issuedUserId,
        "month": month,
        "organizationId": organizationId,
        "thresholdPriceDay": thresholdPriceDay,
        "vehicleCreates": vehicleCreates == null
            ? []
            : List<dynamic>.from(vehicleCreates!.map((x) => x.toJson())),
        "year": year,
      };
}

class VehicleCreate {
  final String? color;
  final DateTime? endDate;
  final List<String>? fileIds;
  final String? identification;
  final bool? isReduce;
  final String? licensePlate;
  final String? manufacturer;
  final String? model;
  final String? note;
  final String? ownerName;
  final String? ownerPhoneNumber;
  final DateTime? registrationDate;
  final String? vehicleTypeId;
  final ImageModel? frontPhoto;
  final ImageModel? backPhoto;
  final String? vehicleTypeCode;
  final String? vehicleTypeName;
  final List<ImageModel>? files;

  VehicleCreate({
    this.color,
    this.endDate,
    this.fileIds,
    this.identification,
    this.isReduce,
    this.licensePlate,
    this.manufacturer,
    this.model,
    this.note,
    this.ownerName,
    this.ownerPhoneNumber,
    this.registrationDate,
    this.vehicleTypeId,
    this.frontPhoto,
    this.backPhoto,
    this.vehicleTypeCode,
    this.vehicleTypeName,
    this.files,
  });

  factory VehicleCreate.fromJson(Map<String, dynamic> json) => VehicleCreate(
        color: json["color"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        fileIds: json["fileIds"] == null ? [] : List<String>.from(json["fileIds"]!.map((x) => x)),
        identification: json["identification"],
        isReduce: json["isReduce"],
        licensePlate: json["licensePlate"],
        manufacturer: json["manufacturer"],
        model: json["model"],
        note: json["note"],
        ownerName: json["ownerName"],
        ownerPhoneNumber: json["ownerPhoneNumber"],
        registrationDate:
            json["registrationDate"] == null ? null : DateTime.parse(json["registrationDate"]),
        vehicleTypeId: json["vehicleTypeId"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "endDate": endDate == null
            ? null
            : "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "fileIds": fileIds == null ? [] : List<dynamic>.from(fileIds!.map((x) => x)),
        "identification": identification,
        "isReduce": isReduce,
        "licensePlate": licensePlate,
        "manufacturer": manufacturer,
        "model": model,
        "note": note,
        "ownerName": ownerName,
        "ownerPhoneNumber": ownerPhoneNumber,
        "registrationDate": registrationDate == null
            ? null
            : "${registrationDate!.year.toString().padLeft(4, '0')}-${registrationDate!.month.toString().padLeft(2, '0')}-${registrationDate!.day.toString().padLeft(2, '0')}",
        "vehicleTypeId": vehicleTypeId,
      };

  VehicleCreate copyWith({
    String? color,
    DateTime? endDate,
    List<String>? fileIds,
    String? identification,
    bool? isReduce,
    String? licensePlate,
    String? manufacturer,
    String? model,
    String? note,
    String? ownerName,
    String? ownerPhoneNumber,
    DateTime? registrationDate,
    String? vehicleTypeId,
    ImageModel? frontPhoto,
    ImageModel? backPhoto,
    String? vehicleTypeCode,
    String? vehicleTypeName,
    List<ImageModel>? files,
  }) {
    return VehicleCreate(
      color: color ?? this.color,
      endDate: endDate ?? this.endDate,
      fileIds: fileIds ?? this.fileIds,
      identification: identification ?? this.identification,
      isReduce: isReduce ?? this.isReduce,
      licensePlate: licensePlate ?? this.licensePlate,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      note: note ?? this.note,
      ownerName: ownerName ?? this.ownerName,
      ownerPhoneNumber: ownerPhoneNumber ?? this.ownerPhoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      frontPhoto: frontPhoto ?? this.frontPhoto,
      backPhoto: backPhoto ?? this.backPhoto,
      vehicleTypeCode: vehicleTypeCode ?? this.vehicleTypeCode,
      vehicleTypeName: vehicleTypeName ?? this.vehicleTypeName,
      files: files ?? this.files,
    );
  }
}
