import 'package:flutter/cupertino.dart';
import 'package:home_care/core/core.dart';

enum VehicleType {
  car(value: 'CAR', code: 'MPT001'),
  motor(value: 'MOTOR', code: 'MPT002'),
  bike(value: 'BIKE', code: 'MPT003'),
  unknown(value: "UNKNOWN", code: "");

  final String value;
  final String code;

  const VehicleType({
    required this.value,
    required this.code,
  });

  static Widget getIcon(VehicleType? type) {
    switch (type) {
      case VehicleType.car:
        return AppSvgs.icCar;
      case VehicleType.motor:
        return AppSvgs.icMotobike;
      case VehicleType.bike:
        return AppSvgs.icBike;
      default:
        return const SizedBox.shrink();
    }
  }

  static String getLabel(BuildContext context, VehicleType? type) {
    final tr = Utils.languageOf(context);

    return tr.vehicle_type_name(type?.value ?? '');
  }

  static VehicleType fromCode(String code) {
    switch (code) {
      case 'MPT001':
        return VehicleType.car;
      case 'MPT002':
        return VehicleType.motor;
      case 'MPT003':
        return VehicleType.bike;
      default:
        return VehicleType.car;
    }
  }

  static VehicleType getName(String value) {
    switch (value) {
      case "Xe máy":
        return VehicleType.motor;
      case "Ô tô":
        return VehicleType.car;
      case "Xe đạp":
        return VehicleType.bike;
      default:
        return VehicleType.unknown;
    }
  }
}
