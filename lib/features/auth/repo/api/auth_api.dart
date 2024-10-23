import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/api/i_auth_api.dart';

import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

class AuthApi implements IAuthApi {
  final dio = Dio();

  AuthApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  // получение токена и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, основной токен, временный токен, пользователь)
  @override
  Future<(bool, String, dynamic)> logIn(
      {required String username, required String password}) async {
    try {
      // устанавливаем параметры запроса
      dio.options.contentType = Headers.formUrlEncodedContentType;
      // делаем сам запрос
      final response = await dio.post(
        '/api/v1/auth/token/login/',
        data: {
          'username': username,
          'password': password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      // возвращаем результат
      return (false, '', response.data);
    } on DioException catch (e) {
      // если возникла ошибка, то возвращаем ее
      if (e.response != null) {
        return (true, e.response.toString(), null);
      } else {
        return (true, '${e.requestOptions}; ${e.message}', null);
      }
    }
  }

  // получение токена и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, временный токен)
  @override
  Future<(bool, String, dynamic)> refreshAccessToken(
      {required String token}) async {
    try {
      // устанавливаем параметры запроса
      dio.options.headers["Authorization"] = 'Token $token';
      // делаем сам запрос
      final response = await dio.get('/api/v1/auth/token/login/');
      // если получено все без ошибок, возвращаем токен и пользователя
      return (
        false,
        '',
        response.data,
      );
    } on DioException catch (e) {
      // если возникла ошибка, то возвращаем ее
      if (e.response != null) {
        return (true, e.response.toString(), '');
      } else {
        return (true, '${e.requestOptions}; ${e.message}', '');
      }
    }
  }

  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, список пользователей)
  @override
  Future<(bool, String, dynamic)> me({required String token}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';
    // делаем сам запрос
    final response = await dio.get('/api/v1/employees/me/');
    // возвращаем результат
    return (false, '', response.data);
  }
}
