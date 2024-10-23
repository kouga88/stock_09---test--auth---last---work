import 'dart:convert';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_type_of_ops_api.dart';
import 'package:get_it/get_it.dart';

class TypeOpsApiMock implements ITypeOpsApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getTypeOpsShort(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('get_typeOps_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getTypeOpsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_typeOps');
    var data = jsonDecode(jsonString);

    data['page'] = page;
    data['page_size'] = page_size;
    data['count'] = (data['results'] as List<dynamic>).length;

    int i = 0;
    data['results'].removeWhere((item) {
      i++;
      return i > page_size;
    });

    data['results']
        .sort((a, b) => (a['name'] ?? '').compareTo(b['name'] ?? ''));
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> createTypeOps({
    required String token,
    required String name,
    required String description,
  }) async {
    String jsonString = await apiMocker.getJson('create_typeOps_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;

    data['description'] = description;
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editTypeOps({
    required String token,
    required int id,
    required String? name,
    required String? description,
  }) async {
    String jsonString = await apiMocker.getJson('edit_typeOps_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['description'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteTypeOps({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getTypeOpsDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
