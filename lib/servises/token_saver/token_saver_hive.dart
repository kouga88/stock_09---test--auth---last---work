// ignore_for_file: constant_identifier_names, override_on_non_overriding_member

import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';
import 'package:hive/hive.dart';

class TokenSaverHive implements ITokenSaver {
  // названия ключей для хранения в локальном хранилище
  static const auth_token = 'auth_token';
  static const REFRESH_TOKEN = 'refresh_token';
  static const TOKEN_BOX_NAME = 'auth_token';

  // сохранение сразу обоих токенов
  @override
  Future<void> saveTokens(String? acessToken) async {
    //, String? refreshToken
    var box = await Hive.openBox(TOKEN_BOX_NAME);
    try {
      if (acessToken != null) {
        await box.put(auth_token, acessToken);
      }
      // if (refreshToken != null) {
      //   await box.put(REFRESH_TOKEN, refreshToken);
      // }
    } finally {
      await box.close();
    }
  }

  // сохранение токена доступа
  @override
  Future<void> saveAccessTokens(String? acessToken) async {
    var box = await Hive.openBox(TOKEN_BOX_NAME);
    try {
      if (acessToken != null) {
        await box.put(auth_token, acessToken);
      }
    } finally {
      await box.close();
    }
  }

  // получение токена доступа
  @override
  Future<String?> getAccessToken() async {
    var box = await Hive.openBox(TOKEN_BOX_NAME);
    try {
      return await box.get(auth_token);
    } finally {
      await box.close();
    }
  }

  // получение токена обновления
  @override
  Future<String?> getRefreshToken() async {
    var box = await Hive.openBox(TOKEN_BOX_NAME);
    try {
      return await box.get(REFRESH_TOKEN);
    } finally {
      await box.close();
    }
  }

  // очистить токены
  @override
  Future<void> clearTokens() async {
    var box = await Hive.openBox(TOKEN_BOX_NAME);
    try {
      await box.delete(auth_token);
      await box.delete(REFRESH_TOKEN);
    } finally {
      await box.close();
    }
  }
}
