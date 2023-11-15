// To parse this JSON data, do
//
//     final vehicleDetail = vehicleDetailFromJson(jsonString);

import 'dart:convert';

VehicleDetail vehicleDetailFromJson(String str) => VehicleDetail.fromJson(json.decode(str));

String vehicleDetailToJson(VehicleDetail data) => json.encode(data.toJson());

class VehicleDetail {
  final String? approvalStatus;
  final String? buildingId;
  final String? buildingName;
  final String? color;
  final String? contractId;
  final String? createdAt;
  final String? createdBy;
  final bool? deleted;
  final String? endDate;
  final List<FileElement>? files;
  final String? id;
  final String? licensePlate;
  final String? manufacturer;
  final String? model;
  final String? ownerName;
  final String? registrationDate;
  final String? startDate;
  final String? status;
  final String? vehicleTypeName;

  VehicleDetail({
    this.approvalStatus,
    this.buildingId,
    this.buildingName,
    this.color,
    this.contractId,
    this.createdAt,
    this.createdBy,
    this.deleted,
    this.endDate,
    this.files,
    this.id,
    this.licensePlate,
    this.manufacturer,
    this.model,
    this.ownerName,
    this.registrationDate,
    this.startDate,
    this.status,
    this.vehicleTypeName,
  });

  VehicleDetail copyWith({
    String? approvalStatus,
    String? buildingId,
    String? buildingName,
    String? color,
    String? contractId,
    String? createdAt,
    String? createdBy,
    bool? deleted,
    String? endDate,
    List<FileElement>? files,
    String? id,
    String? licensePlate,
    String? manufacturer,
    String? model,
    String? ownerName,
    String? registrationDate,
    String? startDate,
    String? status,
    String? vehicleTypeName,
  }) =>
      VehicleDetail(
        approvalStatus: approvalStatus ?? this.approvalStatus,
        buildingId: buildingId ?? this.buildingId,
        buildingName: buildingName ?? this.buildingName,
        color: color ?? this.color,
        contractId: contractId ?? this.contractId,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        deleted: deleted ?? this.deleted,
        endDate: endDate ?? this.endDate,
        files: files ?? this.files,
        id: id ?? this.id,
        licensePlate: licensePlate ?? this.licensePlate,
        manufacturer: manufacturer ?? this.manufacturer,
        model: model ?? this.model,
        ownerName: ownerName ?? this.ownerName,
        registrationDate: registrationDate ?? this.registrationDate,
        startDate: startDate ?? this.startDate,
        status: status ?? this.status,
        vehicleTypeName: vehicleTypeName ?? this.vehicleTypeName,
      );

  factory VehicleDetail.fromJson(Map<String, dynamic> json) => VehicleDetail(
    approvalStatus: json["approvalStatus"],
    buildingId: json["buildingId"],
    buildingName: json["buildingName"],
    color: json["color"],
    contractId: json["contractId"],
    createdAt: json["createdAt"],
    createdBy: json["createdBy"],
    deleted: json["deleted"],
    endDate: json["endDate"],
    files: json["files"] == null ? [] : List<FileElement>.from(json["files"]!.map((x) => FileElement.fromJson(x))),
    id: json["id"],
    licensePlate: json["licensePlate"],
    manufacturer: json["manufacturer"],
    model: json["model"],
    ownerName: json["ownerName"],
    registrationDate: json["registrationDate"],
    startDate: json["startDate"],
    status: json["status"],
    vehicleTypeName: json["vehicleTypeName"],
  );

  Map<String, dynamic> toJson() => {
    "approvalStatus": approvalStatus,
    "buildingId": buildingId,
    "buildingName": buildingName,
    "color": color,
    "contractId": contractId,
    "createdAt": createdAt,
    "createdBy": createdBy,
    "deleted": deleted,
    "endDate": endDate,
    "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x.toJson())),
    "id": id,
    "licensePlate": licensePlate,
    "manufacturer": manufacturer,
    "model": model,
    "ownerName": ownerName,
    "registrationDate": registrationDate,
    "startDate": startDate,
    "status": status,
    "vehicleTypeName": vehicleTypeName,
  };
}

class FileElement {
  final String? downloadUrl;
  final String? parkingTicketId;
  final String? viewUrl;

  FileElement({
    this.downloadUrl,
    this.parkingTicketId,
    this.viewUrl,
  });

  FileElement copyWith({
    String? downloadUrl,
    String? parkingTicketId,
    String? viewUrl,
  }) =>
      FileElement(
        downloadUrl: downloadUrl ?? this.downloadUrl,
        parkingTicketId: parkingTicketId ?? this.parkingTicketId,
        viewUrl: viewUrl ?? this.viewUrl,
      );

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    downloadUrl: json["downloadUrl"],
    parkingTicketId: json["parkingTicketId"],
    viewUrl: json["viewUrl"],
  );

  Map<String, dynamic> toJson() => {
    "downloadUrl": downloadUrl,
    "parkingTicketId": parkingTicketId,
    "viewUrl": viewUrl,
  };
}
