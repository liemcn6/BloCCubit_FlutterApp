import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/presentation/routes.dart';
import 'package:home_care/presentation/widgets/error_dialog.dart';

class ErrorHandler {
  static ErrorHandler? _instance;

  factory ErrorHandler() {
    _instance ??= ErrorHandler._internal();
    return _instance!;
  }

  ErrorHandler._internal();

  bool loadError(DioException error) {
    Utils.hideLoading();
    final context = AppNavigator.navigatorKey.currentContext;

    if (context == null) {
      return false;
    }
    final t = Utils.languageOf(context);

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        showErrorDialog(title: t.connection_timeout);
        break;
      case DioExceptionType.badResponse:
        showErrorDialog(
          title: error.response?.data['message'] ?? t.something_went_wrong,
        );
        break;
      case DioExceptionType.cancel:
        Log.e('Request to API server was cancelled');
        break;
      case DioExceptionType.connectionError:
        showErrorDialog(
          title: t.connection_lost_desc,
          headerTitle: t.you_are_offline,
          errorImage: Padding(
            padding: const EdgeInsets.only(top: 22),
            child: AppSvgs.icConnection,
          ),
        );
        return true;
      default:
        showErrorDialog(title: t.something_went_wrong);
        break;
    }

    return false;
  }
}

final class ErrorType {
  ErrorType._();

  static const String accessDenied = "ACCESS_DENIED";
}
