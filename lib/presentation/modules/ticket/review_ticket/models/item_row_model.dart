class ItemRowModel {
  final String? id;
  final String? code;
  final String? name;
  final String? username;
  final String? fullName;
  dynamic value;
  final bool? isSelected;
  final double? area;
  final String? employeeCode;
  final String? title;
  final String? phoneNumber;
  final String? buildingSystemId;
  final String? checklistTemplateId;

  ItemRowModel({
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
    this.checklistTemplateId,
  });

  factory ItemRowModel.fromJson(Map<String, dynamic> json) {
    return ItemRowModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      username: json['username'],
      fullName: json['fullName'],
      value: json['value'],
      isSelected: json['isSelected'],
      area: json['area'],
      employeeCode: json['employeeCode'],
      title: json['title'],
      phoneNumber: json['phoneNumber'],
      buildingSystemId: json['buildingSystemId'],
      checklistTemplateId: json['checklistTemplateId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'username': username,
      'fullName': fullName,
      'value': value,
      'isSelected': isSelected,
      'area': area,
      'employeeCode': employeeCode,
      'title': title,
      'phoneNumber': phoneNumber,
      'buildingSystemId': buildingSystemId,
      'checklistTemplateId': checklistTemplateId,
    };
  }
}

class RatingType {
  static const quality = "QUALITY";
  // static const speed = 'SPEED';
}
