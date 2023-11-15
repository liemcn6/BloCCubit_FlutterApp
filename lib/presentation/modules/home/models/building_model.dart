class BuildingModel {
  String? id;
  String? code;
  String? name;
  bool? isSelected;

  BuildingModel({
    this.id,
    this.code,
    this.name,
    this.isSelected,
  });

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
        id: json['id'] as String?,
        code: json['code'] as String?,
        name: json['name'] as String?,
        isSelected: json['isSelected'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'isSelected': isSelected,
      };
}
