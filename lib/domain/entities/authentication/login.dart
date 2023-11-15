import 'package:equatable/equatable.dart';
import 'package:home_care/data/models/response/authentication/login_data_response.dart';

class Login extends Equatable {
  final LoginDataResponse? data;
  final String? captchaData;
  final String? transactionId;

  const Login({
    this.data,
    this.captchaData,
    this.transactionId,
  });

  @override
  List<Object?> get props => [
        data,
        captchaData,
        transactionId,
      ];
}
