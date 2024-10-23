abstract class IAuthApi {
  // получение токена и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, основной токен, временный токен, пользователь)
  Future<(bool, String, dynamic)> logIn(
      {required String username, required String password});

  // получение токена и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, временный токен)
  Future<(bool, String, dynamic)> refreshAccessToken({required String token});

  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, список пользователей)
  Future<(bool, String, dynamic)> me({required String token});
}
