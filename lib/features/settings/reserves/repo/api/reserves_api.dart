// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/api/i_reserves_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

class ReservesApi implements IReservesApi {
  final dio = Dio();

  ReservesApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getReservesShort(
      {required String token, bool? is_staff}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    final response =
        await dio.get('/api/v1/reserves/?view_fields=["id","name"]');

    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getReservesList({
    required String token,
    required int page_size,
    required int page,
    int? id,
    String? name,
    String? description,
    StoreroomShort? storeroom,
    String? searchText,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';

    Map<String, dynamic> params = {
      'page_size': page_size,
      'page': page,
    };

    if (searchText != null && searchText.isNotEmpty) {
      params['filters'] = '{"and":{"name__contains":"$searchText" }}';
    }

    // делаем сам запрос
    final response = await dio.get(
      '/api/v1/reserves/',
      queryParameters: params,
    );

    //
    // возвращаем результат
    return (false, '', response.data);
  }

// создаение резерва
  @override
  Future<(bool, String, dynamic)> createReserves({
    required String token,
    required dynamic name,
    required dynamic description,
    required StoreroomShort? storeroom,
    required bool? status,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';

      final response = await dio.post('/api/v1/reserves/',
          data: json.encode({
            'name': name,
            'description': description,
            'storeroom': storeroom?.name,
            'status': status,
          }));

      if (response.statusCode == 201) {
        return (true, '', response.data);
      } else {
        return (false, 'Failed to create storeroom', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

// удаление резерва
  @override
  Future<(bool, String, dynamic)> deleteReserves(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.delete('/api/v1/reserves/$id/');

      if (response.statusCode == 204) {
        return (true, '', null);
      } else {
        return (false, 'Failed to delete storeroom', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

// реадактирование резерва
  @override
  Future<(bool, String, dynamic)> editReserves({
    required String token,
    required int id,
    required String name,
    required String description,
    required StoreroomShort? storeroom,
    required bool? status,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/reserves/$id/',
          data: json.encode({
            'name': name,
            'description': description,
            'storeroom': storeroom,
            'status': status,
          }));

      if (response.statusCode == 200) {
        return (true, '', response.data);
      } else {
        return (false, 'Failed to edit storeroom', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

  @override
  Future<(bool, String, dynamic)> getReservesDetail(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.get('/api/v1/reserves/$id/');

      if (response.statusCode == 200) {
        return (true, '', response.data);
      } else {
        return (false, 'Failed to fetch storeroom detail', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }
}
