final class CaptchaDataResponse {
  final String? data;
  final bool? captchaRequired;
  final String? transactionId;

  CaptchaDataResponse({
    required this.data,
    required this.captchaRequired,
    required this.transactionId,
  });

  factory CaptchaDataResponse.fromJson(Map<String, dynamic> json) => CaptchaDataResponse(
        data: json['captcha']['data'],
        captchaRequired: json['captcha']['captchaRequired'],
        transactionId: json['captcha']['transactionId'],
      );

  Map<String, dynamic> toJson() => {
        'captcha': {
          'data': data,
          'captchaRequired': captchaRequired,
          'transactionId': transactionId,
        },
      };
}
