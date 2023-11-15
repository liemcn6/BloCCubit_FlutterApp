class IssueLinkResponse {
  String? id;
  String? code;

  IssueLinkResponse({
    this.id,
    this.code,
  });

  factory IssueLinkResponse.fromJson(Map<String, dynamic> json) => IssueLinkResponse(
        id: json['id'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
      };
}
