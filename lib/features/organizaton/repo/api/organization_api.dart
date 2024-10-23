// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';
import 'i_organization_api.dart';

class OrganizationApi implements IOrganizationApi {
  final dio = Dio();

  OrganizationApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getOrganizationShort(
      {required String token}) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response =
        await dio.get('/api/v1/organizations/?view_fields=["id","name"]');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getOrganizationList({
    required String token,
    required int page_size,
    required int page,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/organizations/', queryParameters: {
      'page': page,
      'page_size': page_size,
    });
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getOrganizationDetail({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.get('/api/v1/organizations/$id/');
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> createOrganization({
    required String token,
    required String name,
    required String description,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.post('/api/v1/organizations/', data: {
      "name": name,
      "description": description,
    });
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> editOrganization({
    required int id,
    required String token,
    required String name,
    required String description,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/organizations/$id/', data: {
        "name": name,
        "description": description,
      });

      return (response.statusCode == 200)
          ? (true, '', response.data)
          : (false, 'Failed to edit organization', null);
    } catch (e) {
      return (false, e.toString(), null); // e.toString()
    }
  }

  @override
  Future<(bool, String, dynamic)> deleteOrganization({
    required String token,
    required int id,
  }) async {
    dio.options.headers["Authorization"] = 'Token $token';
    final response = await dio.delete('/api/v1/organizations/$id/');
    return (false, '', response.data);
  }
}
