// package we need for json encode/decode
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import '../data/models/response/user/identity_token_model/identity_token_model.dart';
import '../data/models/response/user/role_list_model/role_list_model.dart';
import '../data/models/response/user/user_info_model/user_info_model.dart';

class AuthService {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://192.168.1.105:45455/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.json,
    ),
  );

  AuthService() {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<RoleListModel> login(username, password) async {
    try {
      var formData = FormData.fromMap({
        'Username': username,
        'Password': password,
        'RememberLogin': true,
        'ReturnUrl': "com.anet.assistance:/oauth2callback"
      });

      final response = await _dio.post(
        '/Account/Login',
        data: formData,
        queryParameters: {'button': 'login'},
        options: Options(
          headers: {"No-Authentication": true},
        ),
      );
      return RoleListModel.fromJson(response.data);
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<IdentityTokenModel> getToken(username, password) async {
    try {
      var formData = FormData.fromMap({
        'Username': username,
        'Password': password,
        'client_id': "bihamk-android-app",
        'client_secret': "06280921-1855-4ef8-b72e-d9d20e857efb",
        'scope': "openid profile api1 offline_access",
        'redirect_uri': "com.anet.bihamk:/oauth2callback",
        'grant_type': "password",
      });

      final response = await _dio.post(
        '/connect/token',
        data: formData,
        options: Options(
          headers: {"No-Authentication": true},
        ),
      );
      return IdentityTokenModel.fromJson(response.data);
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserInfoModel> getUserInfo(token) async {
    try {
      final response = await _dio.get(
        '/connect/userinfo',
        options: Options(
          headers: {
            "No-Authentication": true,
            "Authorization": token,
          },
        ),
      );
      return UserInfoModel.fromJson(response.data);
    } on DioError catch (err) {
      throw err;
    } catch (e) {
      throw e.toString();
    }
  }
}
