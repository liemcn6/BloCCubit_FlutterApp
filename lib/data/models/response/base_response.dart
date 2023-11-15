class BaseResponse {
  int? code;
  dynamic data;
  String? message;
  String? status;
  bool? success;
  int? timestamp;

  BaseResponse({
    this.code,
    this.data,
    this.message,
    this.status,
    this.success,
    this.timestamp,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        code: json["code"],
        data: json["data"],
        message: json["message"],
        status: json["status"],
        success: json["success"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "message": message,
        "status": status,
        "success": success,
        "timestamp": timestamp,
      };
}
