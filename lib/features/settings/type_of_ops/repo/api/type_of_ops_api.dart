import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_type_of_ops_api.dart';

class TypeOpsApi implements ITypeOpsApi {
  final dio = Dio();

  TypeOpsApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getTypeOpsShort(
      {required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response =
        await dio.get('/api/v1/types-of-operation/?view_fields=["id","name"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getTypeOpsList({
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
        await dio.get('/api/v1/types-of-operation/', queryParameters: params);
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getTypeOpsDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/types-of-operation/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createTypeOps({
    required String token,
    required String name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.post('/api/v1/types-of-operation/', data: {
        "name": name,
        "description": description,
      });

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit types-of-operation', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> editTypeOps({
    required int id,
    required String token,
    required String name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response =
          await dio.patch('/api/v1/types-of-operation/$id/', data: {
        "name": name,
        "description": description,
      });

      return (response.statusCode == 200)
          ? (true, '', response.data)
          : (false, 'Failed to edit types-of-operation', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteTypeOps({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/types-of-operation/$id/');
    return (false, '', response.data);
  }
}
