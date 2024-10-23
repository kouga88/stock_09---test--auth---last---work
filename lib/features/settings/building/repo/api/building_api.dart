// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_building_api.dart';

class BuildingApi implements IBuildingApi {
  final dio = Dio();

  BuildingApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getBuildingShort(
      {required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response =
        await dio.get('/api/v1/building-projects/?view_fields=["id","name"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getBuildingList({
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
        await dio.get('/api/v1/building-projects/', queryParameters: params);
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getBuildingDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/building-projects/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createBuilding({
    required String token,
    required String name,
    required String description,
    required bool status,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.post('/api/v1/building-projects/', data: {
        "name": name,
        "description": description,
        "status": status,
      });

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit buildings', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> editBuilding({
    required int id,
    required String token,
    required String name,
    required String description,
    required bool status,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/building-projects/$id/', data: {
        "name": name,
        "description": description,
        "status": status,
      });

      return (response.statusCode == 200)
          ? (true, '', response.data)
          : (false, 'Failed to edit buildings', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteBuilding({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/building-projects/$id/');
    return (false, '', response.data);
  }
}
