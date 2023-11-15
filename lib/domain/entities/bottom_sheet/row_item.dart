import 'package:equatable/equatable.dart';

class RowItem<T> extends Equatable {
  final String? id;
  final String? code;
  final String? name;
  final String? username;
  final String? fullName;
  final T? value;
  final bool? isSelected;
  final double? area;
  final String? employeeCode;
  final String? title;
  final String? phoneNumber;
  final String? buildingSystemId;
  final bool? isDisabled;
  final String? disabledReason;

  const RowItem({
    this.id,
    this.code,
    this.name,
    this.value,
    this.isSelected,
    this.username,
    this.fullName,
    this.area,
    this.employeeCode,
    this.title,
    this.phoneNumber,
    this.buildingSystemId,
    this.isDisabled,
    this.disabledReason,
  });

  factory RowItem.fromJson(Map<String, dynamic> json) => RowItem(
        id: json['id'] as String?,
        code: json['code'] as String?,
        name: json['name'] as String?,
        value: json['value'],
        isSelected: json['isSelected'] as bool?,
        username: json['username'] as String?,
        fullName: json['fullName'] as String?,
        area: json['area'] as double?,
        employeeCode: json['employeeCode'] as String?,
        title: json['title'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        buildingSystemId: json['buildingSystemId'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'value': value,
        'isSelected': isSelected,
        'username': username,
        'fullName': fullName,
        'area': area,
        'employeeCode': employeeCode,
        'title': title,
        'phoneNumber': phoneNumber,
        'buildingSystemId': buildingSystemId,
      };

  RowItem<T> copyWith({
    String? id,
    String? code,
    String? name,
    dynamic value,
    bool? isSelected,
    String? username,
    String? fullName,
    double? area,
    String? employeeCode,
    String? title,
    String? phoneNumber,
    String? buildingSystemId,
    bool? isDisabled,
    String? disabledReason,
  }) {
    return RowItem(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      value: value ?? this.value,
      isSelected: isSelected ?? this.isSelected,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      area: area ?? this.area,
      employeeCode: employeeCode ?? this.employeeCode,
      title: title ?? this.title,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      buildingSystemId: buildingSystemId ?? this.buildingSystemId,
      isDisabled: isDisabled ?? this.isDisabled,
      disabledReason: disabledReason ?? this.disabledReason,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      code,
      name,
      value,
      isSelected,
      username,
      fullName,
      area,
      employeeCode,
      title,
      phoneNumber,
      buildingSystemId,
      isDisabled,
      disabledReason,
    ];
  }

  factory RowItem.empty() => const RowItem(
        id: '',
        code: '',
        name: '',
        value: null,
        isSelected: false,
        username: '',
        fullName: '',
        area: 0,
        employeeCode: '',
        title: '',
        phoneNumber: '',
        buildingSystemId: '',
        isDisabled: false,
        disabledReason: '',
      );
}
