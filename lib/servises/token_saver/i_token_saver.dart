abstract class ITokenSaver {
  // сохранение сразу обоих токенов
  // Future<void> saveTokens(String? accessToken); // ,String? refreshToken

  // сохранение токена доступа
  Future<void> saveAccessTokens(String? acessToken);

  // получение токена доступа
  Future<String?> getAccessToken();

  // получение токена обновления
  // Future<String?> getRefreshToken();

  // очистить токены
  Future<void> clearTokens();
}
