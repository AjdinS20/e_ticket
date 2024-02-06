// package we need for json encode/decode
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import '../helpers/shared_preferences.dart';
import '../startup.dart';

abstract class BaseService {
  late final Dio dio = singleton.get<DioClient>()._dio;

  BaseService() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}

class DioClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.1.105:45456/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );

  DioClient() {
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;
}

class DioInterceptor extends Interceptor {
  final identity = singleton.get<SharedPreferencesHelper>().getIdentity();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers["No-Authorization"] != true && identity != null) {
      options.headers['Authorization'] = "Bearer " + identity!.token;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    if (response.statusCode == 401)
      singleton.get<SharedPreferencesHelper>().removeIdentity();
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
