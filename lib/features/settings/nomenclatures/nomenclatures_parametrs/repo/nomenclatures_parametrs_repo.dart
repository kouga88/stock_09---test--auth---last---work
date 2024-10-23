// ignore_for_file: non_constant_identifier_names, unnecessary_cast

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/api/i_nomenclatures_parametrs_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class NomenclaturesParametrsRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final reservesApi = GetIt.I<INomenclaturesParametrsApi>();

// получение короткого имени параметра номенклатуы
  Future<List<NomenclaturesParametrs>> getNomenclaturesParametrsShort({
    int? id,
    String? searchText,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getNomenclaturesParametrsShort, {}); //
    // если получено все без ошибок, то возвращаем ответ
    List<NomenclaturesParametrs> list = [];
    for (final reserves in data['results']) {
      list.add(NomenclaturesParametrs.fromJson(reserves));
    }
    return (list);
  }

// получение короткого имени параметра номенклатуы
  Future<List<NomenclaturesParametrs>> getParamsForNom() async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getNomenclaturesParametrsShort, {});

    List<NomenclaturesParametrs> list = [];
    for (final reserves in data['results']) {
      list.add(NomenclaturesParametrs.fromJson(reserves));
    }
    return (list);
  }

// получение полного списка параметра номенклатуы
  Future<(List<NomenclaturesParametrs>, int)> getNomenclaturesParametrsList({
    required int page_size,
    required int page,
    int? id,
    String? searchText,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getNomenclaturesParametrsList,
        {#page_size: page_size, #page: page, #searchText: searchText});

    List<NomenclaturesParametrs> list = [];
    for (final reserves in data['results']) {
      list.add(
          NomenclaturesParametrs.fromJson(reserves) as NomenclaturesParametrs);
    }

    return (list, (data['count'] as int));
  }

  // создание нового параметра номенклатуы
  Future<NomenclaturesParametrs> createNewNomenclaturesParametrs({
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.createNomenclaturesParametrs, {
      #name: name,
      #unit: unit,
      #description: description,
    });

    return NomenclaturesParametrs.fromJson(data);
  }

  // изменить параметра номенклатуы
  Future<NomenclaturesParametrs> editNomenclaturesParametrs({
    required int id,
    required String name,
    required UnitShort? unit,
    required String description,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.editNomenclaturesParametrs, {
      #id: id,
      #name: name,
      #unit: unit,
      #description: description,
    });

    return NomenclaturesParametrs.fromJson(data);
  }

  // удаление параметра номенклатуы
  Future<void> deleteNomenclaturesParametrs({
    required int id,
  }) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.deleteNomenclaturesParametrs, {#id: id});
  }

  // получить параметра номенклатуы по его id
  Future<NomenclaturesParametrs> getNomenclaturesParametrsDetail(int id) async {
    final data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getNomenclaturesParametrsDetail, {#id: id});
    return NomenclaturesParametrs.fromJson(data);
  }

  getNomenclaturesParametrsShortsShort() {}
}
