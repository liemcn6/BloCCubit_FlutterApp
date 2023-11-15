class TargetModel {
  int? createdAt;
  String? createdBy;
  bool? deleted;
  String? id;
  int? lastModifiedAt;
  String? lastModifiedBy;
  String? newsId;
  String? targetId;
  String? targetName;
  String? targetType;
  TargetModel({
    this.createdBy,
    this.deleted,
    this.id,
    this.lastModifiedAt,
    this.lastModifiedBy,
    this.newsId,
    this.targetId,
    this.targetName,
    this.targetType,
  });

  factory TargetModel.fromJson(Map<String, dynamic> json) => TargetModel(
        createdBy: json['createdBy'] as String?,
        deleted: json['deleted'] as bool?,
        id: json['id'] as String?,
        lastModifiedAt: json['lastModifiedAt'] as int?,
        lastModifiedBy: json['lastModifiedBy'] as String?,
        newsId: json['newsId'] as String?,
        targetId: json['targetId'] as String?,
        targetName: json['targetName'] as String?,
        targetType: json['targetType'] as String?,
      )..createdAt = json['createdAt'] as int?;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'createdBy': createdBy,
        'deleted': deleted,
        'id': id,
        'lastModifiedAt': lastModifiedAt,
        'lastModifiedBy': lastModifiedBy,
        'newsId': newsId,
        'targetId': targetId,
        'targetName': targetName,
        'targetType': targetType,
      };
}
