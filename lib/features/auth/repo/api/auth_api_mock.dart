import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/api/i_auth_api.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

class AuthApiMock implements IAuthApi {
  final apiMocker = GetIt.I<ApiMocker>();

  // получение токена и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, основной токен, временный токен, пользователь)
  @override
  Future<(bool, String, dynamic)> logIn(
      {required String username, required String password}) async {
    String jsonStringOk = await apiMocker.getJson('sign_in_ok');
    String jsonStringError = await apiMocker.getJson('sign_in_error');
    var data = username == 'test' && password == 'test'
        ? jsonDecode(jsonStringOk)
        : jsonDecode(jsonStringError);
    return (false, '', data);
  }

  // получение токена и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, временный токен)
  @override
  Future<(bool, String, dynamic)> refreshAccessToken(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('refresh_token_ok');
    return (false, '', jsonDecode(jsonString));
  }

  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, список пользователей)
  @override
  Future<(bool, String, dynamic)> me({required String token}) async {
    String jsonString = await apiMocker.getJson('me_ok');
    var data = jsonDecode(jsonString);
    return (false, '', data);
  }
}
