// ignore_for_file: constant_identifier_names, override_on_non_overriding_member

import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TokenSaverPrefs implements ITokenSaver {
  // синглтон для работы с локальным хранилищем
  final prefs = GetIt.I<SharedPreferences>();

  // названия ключей для хранения в локальном хранилище
  static const auth_token = 'auth_token';
  // static const REFRESH_TOKEN = 'refresh_token';

  // сохранение сразу обоих токенов
  @override
  Future<void> saveTokens(String? acessToken) async {
    //, String? refreshToken
    if (acessToken != null) {
      await prefs.setString(auth_token, acessToken);
    }
    // if (refreshToken != null) {
    //   await prefs.setString(REFRESH_TOKEN, refreshToken);
    // }
  }

  // сохранение токена доступа
  @override
  Future<void> saveAccessTokens(String? acessToken) async {
    if (acessToken != null) {
      await prefs.setString(auth_token, acessToken);
    }
  }

  // получение токена доступа
  @override
  Future<String?> getAccessToken() async {
    return prefs.getString(auth_token);
  }

  // получение токена обновления
  // @override
  // Future<String?> getRefreshToken() async {
  //   return prefs.getString(REFRESH_TOKEN);
  // }

  // очистить токены
  @override
  Future<void> clearTokens() async {
    await prefs.remove(auth_token);
    // await prefs.remove(REFRESH_TOKEN);
  }
}
