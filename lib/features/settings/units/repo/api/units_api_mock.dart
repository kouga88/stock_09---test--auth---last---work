import 'dart:convert';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_units_api.dart';
import 'package:get_it/get_it.dart';

class UnitsApiMock implements IUnitsApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getUnitShort({required String token}) async {
    String jsonString = await apiMocker.getJson('get_units_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getUnitsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_units');
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
        .sort((a, b) => (a['full_name'] ?? '').compareTo(b['full_name'] ?? ''));
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> createUnits({
    required String token,
    required String full_name,
    required String short_name,
    required String description,
  }) async {
    String jsonString = await apiMocker.getJson('create_units_ok');
    var data = jsonDecode(jsonString);
    data['full_name'] = full_name;
    data['short_name'] = short_name;
    data['description'] = description;
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editUnits({
    required String token,
    required int id,
    required String? full_name,
    required String? short_name,
    required String? description,
  }) async {
    String jsonString = await apiMocker.getJson('edit_units_ok');
    var data = jsonDecode(jsonString);
    data['full_name'] = full_name;
    data['short_name'] = short_name;
    data['description'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteUnits({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getUnitsDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
