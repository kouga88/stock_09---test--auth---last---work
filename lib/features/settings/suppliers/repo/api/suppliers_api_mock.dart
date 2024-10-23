import 'dart:convert';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_suppliers_api.dart';
import 'package:get_it/get_it.dart';

class SuppliersApiMock implements ISuppliersApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getSuppliersShort(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('get_suppliers_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getSuppliersList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_suppliers');
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
  Future<(bool, String, dynamic)> createSuppliers({
    required String token,
    required String name,
    required String description,
  }) async {
    String jsonString = await apiMocker.getJson('create_suppliers_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;

    data['description'] = description;
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editSuppliers({
    required String token,
    required int id,
    required String? name,
    required String? description,
  }) async {
    String jsonString = await apiMocker.getJson('edit_suppliers_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['description'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteSuppliers({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getSuppliersDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
