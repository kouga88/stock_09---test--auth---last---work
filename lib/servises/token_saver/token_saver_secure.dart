// ignore_for_file: constant_identifier_names

import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenSaverSecure implements ITokenSaver {
  // синглтон для работы с локальным хранилищем
  final storage = const FlutterSecureStorage();

  // названия ключей для хранения в локальном хранилище
  static const auth_token = 'auth_token';
  // static const auth_token_SET_AT = 'auth_token_set_at';
  // static const REFRESH_TOKEN = 'refresh_token';
  // static const MIN_MINUTE_FOR_EXPIRE = 1200000;
  // static const MAX_MINUTE_FOR_EXPIRE = 1700000;

  // сохранение сразу обоих токенов
  // @override
  // Future<void> saveTokens(
  //   String? acessToken,
  // ) async {
  //   // String? refreshToken
  //   if (acessToken != null) {
  //     await storage.write(key: auth_token, value: acessToken);
  //     // await storage.write(
  //     //     key: auth_token_SET_AT,
  //     //     value: DateFormat('yyyy-MM-ddTkk:mm:ss').format(DateTime.now()));
  //   }
  //   // if (refreshToken != null) {
  //   //   await storage.write(key: REFRESH_TOKEN, value: refreshToken);
  //   // }
  // }

  // сохранение токена доступа
  @override
  Future<void> saveAccessTokens(String? acessToken) async {
    if (acessToken != null) {
      await storage.write(key: auth_token, value: acessToken);
      //   await storage.write(
      //       key: auth_token_SET_AT,
      //       value: DateFormat('yyyy-MM-ddTkk:mm:ss').format(DateTime.now()));
    }
  }

  // получение токена доступа
  @override
  Future<String?> getAccessToken() async {
    return await storage.read(key: auth_token);
    // String? setAtString = await storage.read(key: auth_token_SET_AT);
    // if (setAtString == null) {
    //   return null;
    // }
    // DateTime setAt = DateTime.parse(setAtString);
    // Duration difference = DateTime.now().difference(setAt);
    // Random rnd = Random();
    // int minuteForExpire =
    //     rnd.nextInt(MAX_MINUTE_FOR_EXPIRE - MIN_MINUTE_FOR_EXPIRE) +
    //         MIN_MINUTE_FOR_EXPIRE;
    // if (difference.inMinutes > minuteForExpire) {
    //   return null;
    // }
  }

  // получение токена обновления
  // @override
  // Future<String?> getRefreshToken() async {
  //   return await storage.read(key: REFRESH_TOKEN);
  // }

  // очистить токены
  @override
  Future<void> clearTokens() async {
    await storage.delete(key: auth_token);
    // await storage.delete(key: REFRESH_TOKEN);
  }
}
