import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:home_care/core/core.dart';
import 'package:home_care/data/data_source/local/app_secure_storage.dart';
import 'package:home_care/data/data_source/local/app_storage.dart';
import 'package:home_care/data/data_source/remote/api_endpoints.dart';
import 'package:home_care/data/data_source/remote/error_handler.dart';
import 'package:home_care/data/models/response/authentication/login_data_response.dart';
import 'package:home_care/data/models/response/base_response.dart';
import 'package:home_care/presentation/routes.dart';

import 'config_environments.dart';

bool noNeedToken(String path) {
  bool isNoNeedToken = false;
  const List<String> list = [
    ApiEndpoints.appConfig,
    ApiEndpoints.forgotPassword,
    ApiEndpoints.login,
    ApiEndpoints.resetPassword,
    ApiEndpoints.refreshToken,
    ApiEndpoints.register,
  ];

  for (var item in list) {
    if (path.contains(item)) {
      isNoNeedToken = true;
      break;
    }
  }

  return isNoNeedToken;
}

void logRequest(RequestOptions options) {
  Log.i('### Request Log ###');
  Log.i('URL: ${options.uri}');
  Log.i('Method: ${options.method}');
  Log.i('Headers: ${options.headers}');
  if (options.data is! FormData) {
    Log.i('Request: ${jsonEncode(options.data)}');
  }
  Log.i('### End Request Log ###');
}

void logResponse(Response response) {
  Log.i('### Response Log ###');
  Log.i('Status Code: ${response.statusCode}');
  Log.i('Status Message: ${response.statusMessage}');
  Log.i('Response: ${jsonEncode(response.data)}');
  Log.i('### End Response Log ###');
}

class BaseRepository {
  Future<Response> get(path, [data, Map<String, dynamic>? queries]) async {
    return _DioHelper.instance.get(
      path,
      data: data,
      queryParameters: queries,
    );
  }

  Future<Response> post(path, body, [Map<String, dynamic>? queries]) async {
    return _DioHelper.instance.post(
      path,
      body,
      queryParameters: queries,
    );
  }
}

class _DioHelper {
  final _dio = Dio();
  var options = Options(contentType: Headers.jsonContentType, responseType: ResponseType.json);

  _DioHelper._() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.path = ConfigEnvironments.getUrl() + options.path;

        final tokenData = await AppSecureStorage.getToken();
        final accessToken = tokenData?.accessToken;

        options.connectTimeout = const Duration(seconds: 30);
        options.receiveTimeout = const Duration(seconds: 30);

        options.headers["Accept-Language"] = AppStorage().currentLanguage;

        if (accessToken != null && !noNeedToken(options.path)) {
          options.headers['Authorization'] = "Bearer $accessToken";
        }

        if (options.data is FormData) {
          options.contentType = Headers.multipartFormDataContentType;
        }

        logRequest(options);

        return handler.next(options);
      },
      onResponse: (response, handler) {
        logResponse(response);
        return handler.next(response);
      },
      onError: (e, handler) async {
        Log.e(e.toString());
        if (e.response != null) {
          logResponse(e.response!);
        }

        if (e.response?.statusCode == 401) {
          await handleRefreshToken(handler);

          return handler.resolve(await _dio.fetch(e.requestOptions));
        }

        final isBlocked = ErrorHandler().loadError(e);

        if (isBlocked) {
          return handler.reject(e);
        }

        return handler.next(e);
      },
    ));
  }

  Future handleRefreshToken(ErrorInterceptorHandler handler) async {
    final tokenData = await AppSecureStorage.getToken();
    final result = await Result.guardAsync(
      () => post(ApiEndpoints.refreshToken, {'refreshToken': tokenData?.refreshToken}),
    );

    result.ifSuccess((data) async {
      final res = BaseResponse.fromJson(data?.data);
      final tokenRes = LoginDataResponse.fromJson(res.data);
      await AppSecureStorage.setToken(tokenRes);
      final encToken = await Utils.getEncryptToken();
      AppStorage().setImgEncToken(encToken);
    });

    result.ifError((error, errorData) async {
      final context = AppNavigator.navigatorKey.currentContext;
      await AppSecureStorage.clearToken();

      if (context == null || !context.mounted) return;
      final lang = Utils.languageOf(context);

      WidgetUtils.showError(
        context: context,
        errorText: lang.sessionTimeout,
        logout: true,
      );
    });
  }

  static final instance = _DioHelper._();

  Dio get dio => _dio;

  Future<Response> get(
    path, {
    data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    var res = await _dio.get(
      path,
      options: options ?? this.options,
      data: data,
      queryParameters: queryParameters,
    );
    return res;
  }

  Future<Response> post(
    path,
    body, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    var res = await _dio.post(
      path,
      data: body,
      options: options ?? this.options,
      queryParameters: queryParameters,
    );
    return res;
  }
}
