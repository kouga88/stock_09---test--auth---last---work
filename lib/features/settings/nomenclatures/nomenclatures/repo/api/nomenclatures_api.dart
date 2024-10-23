// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_nomenclatures_api.dart';

class NomenclaturesApi implements INomenclaturesApi {
  final dio = Dio();

  NomenclaturesApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesShort(
      {required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response =
        await dio.get('/api/v1/nomenclatures/?view_fields=["id","name"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesList({
    required String token,
    required int page_size,
    required int page,
    String? searchText,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';

    Map<String, dynamic> params = {
      'page_size': page_size,
      'page': page,
      // 'search': searchText ?? '',
    };

    if (searchText != null && searchText.isNotEmpty) {
      params['filters'] = '{"and":{"name__contains":"$searchText" }}';
    }

    final response =
        await dio.get('/api/v1/nomenclatures/', queryParameters: params);
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/nomenclatures/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createNomenclatures({
    required String token,
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.post('/api/v1/nomenclatures/',
          data: {"name": name, "description": description, 'unit': unit!.id});

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit nomenclatures', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> editNomenclatures({
    required int id,
    required String token,
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/nomenclatures/$id/',
          data: {"name": name, "description": description, 'unit': unit!.id});

      return (response.statusCode == 200)
          ? (true, '', response.data)
          : (false, 'Failed to edit nomenclatures', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteNomenclatures({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/nomenclatures/$id/');
    return (false, '', response.data);
  }
}
