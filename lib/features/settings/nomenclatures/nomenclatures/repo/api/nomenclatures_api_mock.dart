// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_nomenclatures_api.dart';
import 'package:get_it/get_it.dart';

class NomenclaturesApiMock implements INomenclaturesApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getNomenclaturesShort(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('get_nomenclatures_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_nomenclatures');
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
  Future<(bool, String, dynamic)> createNomenclatures({
    required String token,
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    String jsonString = await apiMocker.getJson('create_nomenclatures_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;

    data['description'] = description;
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editNomenclatures({
    required String token,
    required int id,
    required String? name,
    required UnitShort? unit,
    required String? description,
  }) async {
    String jsonString = await apiMocker.getJson('edit_nomenclatures_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['description'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteNomenclatures({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
