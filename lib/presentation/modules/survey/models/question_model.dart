class QuestionsModel {
  final String? createdBy;
  final int? createdAt;
  final String? lastModifiedBy;
  final int? lastModifiedAt;
  final String? id;
  final String? content;
  final String? label;
  final String? questionGroupId;
  final String? questionGroupName;
  final String? type;
  final int? rangeAnswer;
  final bool? deleted;

  QuestionsModel({
    this.createdBy,
    this.createdAt,
    this.lastModifiedBy,
    this.lastModifiedAt,
    this.id,
    this.content,
    this.label,
    this.questionGroupId,
    this.questionGroupName,
    this.type,
    this.rangeAnswer,
    this.deleted,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      createdBy: json['createdBy'],
      createdAt: json['createdAt'],
      lastModifiedBy: json['lastModifiedBy'],
      lastModifiedAt: json['lastModifiedAt'],
      id: json['id'],
      content: json['content'],
      label: json['label'],
      questionGroupId: json['questionGroupId'],
      questionGroupName: json['questionGroupName'],
      type: json['type'],
      rangeAnswer: json['rangeAnswer'],
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdBy': createdBy,
      'createdAt': createdAt,
      'lastModifiedBy': lastModifiedBy,
      'lastModifiedAt': lastModifiedAt,
      'id': id,
      'content': content,
      'label': label,
      'questionGroupId': questionGroupId,
      'questionGroupName': questionGroupName,
      'type': type,
      'rangeAnswer': rangeAnswer,
      'deleted': deleted,
    };
  }
}
