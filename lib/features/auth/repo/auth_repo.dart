import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/api/i_auth_api.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class AuthRepo {
  static const String unauthorized = 'unauthorized';
  // static const String noRefreshToken = 'noRefreshToken';

  final tokenSaver = GetIt.I<ITokenSaver>();
  final authApi = GetIt.I<IAuthApi>();

  // авторизация, получение токенов и пользователя с сервера
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки, пользователь)
  Future<(bool, String, User?)> logIn(
      {required String username, required String password}) async {
    // делаем запрос апи
    var (isError, errorMessage, data) =
        await authApi.logIn(username: username, password: password);
    // проверяем на ошибки
    if (isError) {
      return (true, errorMessage, null);
    }

    if (data['auth_token'] == null) {
      return (true, 'Некорректный логин или пароль!', null);
    }
    // получаем нужные данные
    String accessToken = data['auth_token'].toString();
    // String refreshToken = data['refresh_token'].toString();
    // сохраняем токены
    await tokenSaver.saveAccessTokens(accessToken); // ,refreshToken
    // получаем текущего пользователя
    final (user, reason) = await getCurentUser();

    if (user == null) {
      return (true, reason ?? '', null);
    }

    // возвращаем пользователя
    return (false, '', user);
  }

  // обновления токена доступа
  // Возвращаемые значения: (признак наличия ошибки, описание ошибки)
  Future<(bool, String)> refreshAccessToken(
      {required String refreshToken}) async {
    // делаем апи запрос
    var (isError, errorMessage, data) =
        await authApi.refreshAccessToken(token: refreshToken);
    // проверяем на ошибку
    if (isError) {
      // пробуем сделать запрос второй раз
      (isError, errorMessage, data) =
          await authApi.refreshAccessToken(token: refreshToken);
      if (isError) {
        // тут реальная ошибка
        return (isError, errorMessage);
      }
    }
    // получаем нужные данные
    String newAccessToken = data['access_token'].toString();
    // сохраняем токен доступа в локальное хранилище
    await tokenSaver.saveAccessTokens(newAccessToken);
    // возвращаем положительный результат
    return (false, '');
  }

  // получение текущего пользователя или null, если не авторизован
  Future<(User?, String?)> getCurentUser() async {
    try {
      // делаем апи запрос
      var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
          authApi.me, null); // тут ошибка
      // возвращаем результат

      return (User.fromJson(data), null);
    } catch (e, _) {
      return (null, e.toString());
    }
  }

  // выход пользвоателя
  Future<void> logOut() async {
    await tokenSaver.clearTokens();
  }
}
