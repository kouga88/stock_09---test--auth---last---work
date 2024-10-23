// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_department_api.dart';

class DepartmentApi implements IDepartmentApi {
  final dio = Dio();

  DepartmentApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getDepartmentShort(
      {required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response =
        await dio.get('/api/v1/departments/?view_fields=["id","name"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getDepartmentList({
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
        await dio.get('/api/v1/departments/', queryParameters: params);
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getDepartmentDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/departments/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createDepartment({
    required String token,
    required String name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.post('/api/v1/departments/', data: {
        "name": name,
        "description": description,
      });

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit departments', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> editDepartment({
    required int id,
    required String token,
    required String name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/departments/$id/', data: {
        "name": name,
        "description": description,
      });

      return (response.statusCode == 200)
          ? (true, '', response.data)
          : (false, 'Failed to edit departments', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteDepartment({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/departments/$id/');
    return (false, '', response.data);
  }
}
