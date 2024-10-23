// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_organization_api.dart';
import 'package:get_it/get_it.dart';

class OrganizationApiMock implements IOrganizationApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getOrganizationShort(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('get_organization_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getOrganizationList({
    required String token,
    required int page,
    required int page_size,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_organization');
    var data = jsonDecode(jsonString);

    data['page'] = page;
    data['page_size'] = page_size;
    data['count'] = (data['results'] as List<dynamic>).length;

    int i = 0;
    data['results'].removeWhere((item) {
      i++;
      return i > page_size;
    });

    data['results'].sort(
        (a, b) => (a['first_name'] ?? '').compareTo(b['first_name'] ?? ''));
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> createOrganization({
    required String token,
    required String name,
    required String description,
  }) async {
    String jsonString = await apiMocker.getJson('create_organization_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['description'] = description;
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editOrganization({
    required String token,
    required int id,
    required String? name,
    required String? description,
  }) async {
    String jsonString = await apiMocker.getJson('edit_organization_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['organization'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteOrganization({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getOrganizationDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
