import 'package:dio/dio.dart';
import 'package:flutter_mvvm_stacked_template/app/app.dart';
import 'package:get_it/get_it.dart';

class ApiStatusCode {
  static const success = 200;
  static const unauthorised = 401;
  static const forbidden = 403;
}

enum HttpRequestType { get, post }

class BaseApiService {
  BaseApiService() {
    final dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: ApiDefaults.connectTimeoutInMilliseconds,
        receiveTimeout: ApiDefaults.receiveTimeoutInMilliseconds,
      ),
    );

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (error, handler) async {
          if (error.response?.statusCode == ApiStatusCode.unauthorised ||
              error.response?.statusCode == ApiStatusCode.forbidden) {
            try {
              final response = await _refreshToken();

              if (response.isSuccess) {
                final options = error.requestOptions;
                options.headers['Authorization'] = headers['Authorization'];

                final response = await _dio.fetch<void>(options);
                handler.resolve(response);
              }
            } catch (e) {
              if (e is DioError) {
                handler.reject(e);
              }

              handler.reject(error);
            }
          }
          // This should never make it here as we can't have a
          // 200 OK with an error.
          handler.reject(error);
        },
      ),
    );

    _dio = dio;
  }

  late Dio _dio;
  Dio get dio => _dio;

  String? get authToken =>
      GetIt.instance<SharedPreferencesService>().getAccessToken();

  String? get refreshToken =>
      GetIt.instance<SharedPreferencesService>().getRefreshToken();

  String get baseUrl => ApiDefaults.baseUrl();

  Map<String, String> get headers {
    return <String, String>{
      if (authToken != null) 'Authorization': 'Berarer $authToken'
    };
  }

  Future<ResponseModel<TokenModel?>> _refreshToken() async {
    final response = await callApi(
      HttpRequestType.post,
      '$baseUrl/path/to/refresh/token/endpoint',
    );

    if (!response.hasError && response.hasData) {
      return ResponseModel(
        data: TokenModel.fromJson(response.data!),
        status: response.status,
      );
    }

    return ResponseModel.error(response.error);
  }

  Future<ResponseModel<Map<String, dynamic>?>> callApi(
    HttpRequestType requestType,
    String path, {
    bool requiresAuthorisation = false,
    Map<String, dynamic>? postBody,
  }) async {
    try {
      Response<Map<String, dynamic>?> response;

      switch (requestType) {
        case HttpRequestType.get:
          response = await _dio.get(
            path,
            options: Options(
              headers: requiresAuthorisation ? headers : null,
            ),
          );
          break;
        case HttpRequestType.post:
          response = await _dio.post(
            path,
            options: Options(
              headers: requiresAuthorisation ? headers : null,
            ),
          );
          break;
      }

      if (response.statusCode == ApiStatusCode.success) {
        return ResponseModel.success(response.data);
      }

      return ResponseModel.error(
        // TODO: Replace this with your server's generic error key name
        ErrorModel.fromJson(response.data?['error'] as Map<String, dynamic>),
      );
    } catch (e) {
      if (e is DioError) {
        return ResponseModel.error(ErrorModel(errorMessage: e.message));
      }

      return ResponseModel.error(ErrorModel());
    }
  }
}
