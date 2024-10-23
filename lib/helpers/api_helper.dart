import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// import 'package:pronet_storeroom_v_01/features/auth/repo/auth_repo.dart';
// import 'package:pronet_storeroom_v_01/features/auth/repo/auth_repo.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class ApiHelper {
  static Future<dynamic> apiRequestWithTokenAndCheckErrors(
      Function func, Map<Symbol, dynamic>? args) async {
    // получаем токен доступа
    String? token = await GetIt.I<ITokenSaver>().getAccessToken();

    // если токена доступа нет
    // if (token == null) {
    //   // получаем токен обновления
    //   // String? refreshToken = await GetIt.I<ITokenSaver>().getAccessToken();
    //   // if (refreshToken == null) {
    //   //   // если токена обновления нет, кидаем ошибку отсутствия токена обновления, надо выходить на авторизацию
    //   //   throw Exception(AuthRepo.noRefreshToken);
    //   // }
    //   // обновляем токен доступа
    //   // final (isRefreshError, errorMessge) = await GetIt.I<AuthRepo>()
    //   //     .refreshAccessToken(refreshToken: refreshToken);
    //   // if (isRefreshError) {
    //   //   // если не получилось обновить токен доступа при живом токене обновления, то просто кидаем ошибку
    //   //   throw Exception(errorMessge);
    //   // }
    // }
    // попытка 1
    try {
      // добавляем токен к параметрам
      var argsWithToken = args;

      if (argsWithToken != null) {
        argsWithToken.addAll({#token: token});
      } else {
        argsWithToken = {#token: token};
      }
      // делаем запрос апи
      var (_, _, data) = await Function.apply(func, null, argsWithToken);

      // возвращаем данные
      return data;
    } on DioException catch (e) {
      // если возникла ошибка, то возвращаем ее
      if (e.response != null) {
        if (e.response!.statusCode == 401) {
        } else {
          // идем к 2 попытке
        }
      } else {
        // идем к 2 попытке
      }
    }

    // попытка 2
    try {
      // получаем токен доступа
      String? token = await GetIt.I<ITokenSaver>().getAccessToken();
      if (token == null) {
        throw Exception('Отсутствует токен доступа!');
      }
      // добавляем токен к параметрам
      var argsWithToken = args;

      if (argsWithToken != null) {
        argsWithToken.addAll({#token: token});
      } else {
        argsWithToken = {#token: token};
      }
      // делаем запрос апи
      var (_, _, data) = await Function.apply(func, null, argsWithToken);
      // возвращаем данные
      return data;
    } on DioException catch (e) {
      // если возникла ошибка, то возвращаем ее
      if (e.response != null) {
        throw Exception(e.response.toString());
      } else {
        throw Exception('${e.requestOptions}; ${e.message}');
      }
    }
  }
}
