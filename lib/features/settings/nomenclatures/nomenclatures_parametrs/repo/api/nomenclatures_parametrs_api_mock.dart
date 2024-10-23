// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/api/i_nomenclatures_parametrs_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

class NomenclaturesParametrsApiMock implements INomenclaturesParametrsApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getNomenclaturesParametrsShort(
      {required String token, bool? is_staff}) async {
    String jsonString = await apiMocker.getJson('get_storeroom_short');
    var data = jsonDecode(jsonString);
    data.sort((a, b) {
      int res = (a['firstname'] ?? '').compareTo(b['firstname'] ?? '');
      return res;
    });
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getParamsForNom(
      {required String token, bool? is_staff}) async {
    String jsonString = await apiMocker.getJson('get_storeroom_short');
    var data = jsonDecode(jsonString);
    data.sort((a, b) {
      int res = (a['firstname'] ?? '').compareTo(b['firstname'] ?? '');
      return res;
    });
    return (false, '', data);
  }

  // вернуть список пользователей
  @override
  Future<(bool, String, dynamic)> getNomenclaturesParametrsList({
    required String? token,
    required int? page_size,
    required int? page,
    String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_storeroom');
    var data = jsonDecode(jsonString);
    // устанавливаем лимит

    data['page'] = page;
    data['page_size'] = page_size;

    data['count'] = (data['results'] as List<dynamic>).length;
    // удаляем все задачи превышающие лимит
    int i = 0;
    data['results'].removeWhere((item) {
      i++;
      return i > page_size!;
    });

    data['results'].sort((a, b) {
      int res = (a['name'] ?? '').compareTo(b['name'] ?? '');
      return res;
    });
    // возврат результата
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> createNomenclaturesParametrs({
    required String token,
    required dynamic name,
    required UnitShort? unit,
    required dynamic description,
  }) async {
    // получаем список
    final String response = await apiMocker.getJson('create_storeroom_ok');
    final data = await json.decode(response);

    // проставляем данные
    data['name'] = name;
    data['description'] = description;
    data['unit'] = unit;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editNomenclaturesParametrs({
    required String token,
    required int id,
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    // получаем список
    final String response = await apiMocker.getJson('edit_storeroom_ok');
    final data = await json.decode(response);
    // проставляем данные
    data['id'] = id;
    data['name'] = name;
    data['unit'] = unit;
    data['description'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteNomenclaturesParametrs(
      {required String token, required int id}) async {
    // возвращаем результат
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getNomenclaturesParametrsDetail(
      {required String token, required int id}) async {
    throw Exception('');
  }
}
