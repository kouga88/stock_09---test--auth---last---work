// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/api/i_storerooms_api.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

class StoreroomApi implements IStoreroomApi {
  final dio = Dio();

  StoreroomApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getStoreroomShort(
      {required String token}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    final response =
        await dio.get('/api/v1/storerooms/?view_fields=["id","name"]');

    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getStoreroomList({
    required String token,
    required int page_size,
    required int page,
    int? id,
    String? name,
    String? description,
    String? organization,
    String? searchText,
  }) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    // if (id != null && id != 0) {
    //   viewFields.add(id);
    // }
    // if (name != null && name.isNotEmpty) {
    //   viewFields.add(name);
    // }
    // if (name != null && name.isNotEmpty) {
    //   viewFields.add(name);
    // }
    // if (description != null && description.isNotEmpty) {
    //   viewFields.add(description);
    // }

    // if (organization != null && organization.isNotEmpty) {
    //   viewFields.add(organization);
    // }

    Map<String, dynamic> params = {
      'page_size': page_size,
      'page': page,
    };

    if (searchText != null && searchText.isNotEmpty) {
      params['filters'] = '{"and":{"name__contains":"$searchText" }}';
    }

    // if (viewFields.isNotEmpty) {
    //   params['view_fields'] = viewFields;
    // }

    // делаем сам запрос
    final response = await dio.get(
      '/api/v1/storerooms/',
      // '/api/v1/storerooms/?view_fields=["id","storeroomname","name","description","telegram_id","email", "department","organization","is_active","is_superstoreroom","is_staff", {"groups":["id","name"]}]',
      // queryParameters: params,
      queryParameters: params,
    );

    //
    // возвращаем результат
    return (false, '', response.data);
  }

// создаение пользователя
  @override
  Future<(bool, String, dynamic)> createStoreroom({
    required String token,
    required dynamic name,
    required dynamic description,
    required String organization,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';

      final response = await dio.post('/api/v1/storerooms/',
          data: json.encode({
            'name': name,
            'description': description,
            'organization': organization,
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

// удаление пользователя
  @override
  Future<(bool, String, dynamic)> deleteStoreroom(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.delete('/api/v1/storerooms/$id/');

      if (response.statusCode == 204) {
        return (true, '', null);
      } else {
        return (false, 'Failed to delete storeroom', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

// реадактирование пользователя
  @override
  Future<(bool, String, dynamic)> editStoreroom({
    required String token,
    required int id,
    required String name,
    required String description,
    dynamic organization,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/storerooms/$id/',
          data: json.encode({
            'name': name,
            'description': description,
            'organization': organization,
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
  Future<(bool, String, dynamic)> getStoreroomDetail(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.get('/api/v1/storerooms/$id/');

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
