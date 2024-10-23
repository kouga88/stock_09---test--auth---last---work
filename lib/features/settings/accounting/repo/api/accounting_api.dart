// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_accounting_api.dart';

class AccountingApi implements IAccountingApi {
  final dio = Dio();

  AccountingApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getAccountingShort(
      {required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio
        .get('/api/v1/accounting-accounts/?view_fields=["id","number"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getAccountingList({
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
        await dio.get('/api/v1/accounting-accounts/', queryParameters: params);
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getAccountingDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/accounting-accounts/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createAccounting({
    required String token,
    required String name,
    required String number,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.post('/api/v1/accounting-accounts/', data: {
        "name": name,
        "number": number,
      });

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit accounting', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> editAccounting({
    required int id,
    required String token,
    required String name,
    required String number,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response =
          await dio.patch('/api/v1/accounting-accounts/$id/', data: {
        "name": name,
        "number": number,
      });

      return (response.statusCode == 201)
          ? (true, '', response.data)
          : (false, 'Failed to edit accounting', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteAccounting({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/accounting-accounts/$id/');
    return (false, '', response.data);
  }
}
