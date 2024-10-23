// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/api/i_units_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class UnitsRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final unitsApi = GetIt.I<IUnitsApi>();

  // получить список групп
  Future<List<UnitShort>> getUnitShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        unitsApi.getUnitShort, {});
    // если получено все без ошибок, то возвращаем ответ
    List<UnitShort> list = [];
    for (final units in data['results']) {
      list.add(UnitShort.fromJson(units));
    }

    return list;
  }

  Future<(List<Units>, int)> getUnitsList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        unitsApi.getUnitsList,
        {#page: page, #page_size: page_size, #searchText: searchText});
    // если получено все без ошибок, то возвращаем ответ
    List<Units> list = [];
    for (final units in data['results']) {
      list.add(Units.fromJson(units));
    }
    return (list, (data['count'] as int));
  }

  // получить детали ед. измерения
  Future<Units> getUnitsDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        unitsApi.getUnitsDetail, {#id: id});
    return Units.fromJson(data);
  }

  // изменить ед. измерения
  Future<Units> editUnitsRepo({
    required int id,
    required String? full_name,
    required String? short_name,
    required String? description,
  }) async {
    var data =
        await ApiHelper.apiRequestWithTokenAndCheckErrors(unitsApi.editUnits, {
      #id: id,
      #full_name: full_name,
      #short_name: short_name,
      #description: description,
    });

    return Units.fromJson(data);
  }

  // удаление ед. измерения
  Future<void> deleteUnits({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        unitsApi.deleteUnits, {#id: id});
  }

  // создать ед. измерения
  Future<Units> createNewUnits({
    required String full_name,
    required String short_name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        unitsApi.createUnits, {
      #full_name: full_name,
      #short_name: short_name,
      #description: description,
    });
    // возвращаем созданную ед. измерения
    return Units.fromJson(data);
  }
}
