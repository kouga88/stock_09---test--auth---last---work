import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_units_api.dart';

class UnitsApi implements IUnitsApi {
  final dio = Dio();

  UnitsApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getUnitShort({required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response =
        await dio.get('/api/v1/units/?view_fields=["id","short_name"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getUnitsList({
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
      params['filters'] = '{"and":{"full_name__contains":"$searchText" }}';
    }

    final response = await dio.get('/api/v1/units/', queryParameters: params);
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getUnitsDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/units/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createUnits({
    required String token,
    required String full_name,
    required String short_name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.post('/api/v1/units/', data: {
        "full_name": full_name,
        "short_name": short_name,
        "description": description,
      });

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit units', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> editUnits({
    required int id,
    required String token,
    required String full_name,
    required String short_name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/units/$id/', data: {
        "full_name": full_name,
        "short_name": short_name,
        "description": description,
      });

      return (response.statusCode == 200)
          ? (true, '', response.data)
          : (false, 'Failed to edit units', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteUnits({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/units/$id/');
    return (false, '', response.data);
  }
}
