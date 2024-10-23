// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/api/i_nomenclatures_parametrs_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

class NomenclaturesParametrsApi implements INomenclaturesParametrsApi {
  final dio = Dio();

  NomenclaturesParametrsApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesParametrsShort(
      {required String token}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    final response = await dio
        .get('/api/v1/parameters-of-nomenclature/?view_fields=["id","name"]');

    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getParamsForNom(
      {required String token}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    final response = await dio.get('/api/v1/parameters-of-nomenclature/');

    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesParametrsList({
    required String token,
    required int page_size,
    required int page,
    int? id,
    String? name,
    String? description,
    UnitShort? unit,
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
      '/api/v1/parameters-of-nomenclature/',
      queryParameters: params,
    );

    //
    // возвращаем результат
    return (false, '', response.data);
  }

// создаение резерва
  @override
  Future<(bool, String, dynamic)> createNomenclaturesParametrs({
    required String token,
    required dynamic name,
    required dynamic description,
    required UnitShort? unit,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';

      final response = await dio.post('/api/v1/parameters-of-nomenclature/',
          data: json.encode({
            'name': name,
            'description': description,
            'unit': unit?.short_name,
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
  Future<(bool, String, dynamic)> deleteNomenclaturesParametrs(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response =
          await dio.delete('/api/v1/parameters-of-nomenclature/$id/');

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
  Future<(bool, String, dynamic)> editNomenclaturesParametrs({
    required String token,
    required int id,
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response =
          await dio.patch('/api/v1/parameters-of-nomenclature/$id/',
              data: json.encode({
                'name': name,
                'description': description,
                'storeroom': unit,
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
  Future<(bool, String, dynamic)> getNomenclaturesParametrsDetail(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.get('/api/v1/parameters-of-nomenclature/$id/');

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
