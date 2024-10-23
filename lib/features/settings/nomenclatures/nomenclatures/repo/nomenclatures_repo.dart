// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/api/i_nomenclatures_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';

import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class NomenclaturesRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final nomenclaturesApi = GetIt.I<INomenclaturesApi>();

  // получить список групп
  Future<List<NomenclaturesShort>> getNomenclaturesShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesApi.getNomenclaturesShort, {});

    List<NomenclaturesShort> list = [];
    for (final nomenclatures in data['results']) {
      list.add(NomenclaturesShort.fromJson(nomenclatures));
    }

    return list;
  }

  Future<(List<Nomenclatures>, int)> getNomenclaturesList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesApi.getNomenclaturesList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<Nomenclatures> list = [];
    for (final nomenclatures in data['results']) {
      list.add(Nomenclatures.fromJson(nomenclatures));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<Nomenclatures> getNomenclaturesDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesApi.getNomenclaturesDetail, {#id: id});
    return Nomenclatures.fromJson(data);
  }

  // изменить группу
  Future<Nomenclatures> editNomenclaturesRepo({
    required int id,
    required String? name,
    required UnitShort? unit,
    required StoreroomShort? storeroom,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesApi.editNomenclatures, {
      #id: id,
      #name: name,
      #unit: unit,
      #storehouse: storeroom,
      #description: description,
    });

    return Nomenclatures.fromJson(data);
  }

  // удаление группы
  Future<void> deleteNomenclatures({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesApi.deleteNomenclatures, {#id: id});
  }

  // создать группу
  Future<Nomenclatures> createNewNomenclatures({
    required String name,
    required UnitShort? unit,
    required StoreroomShort? storeroom,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesApi.createNomenclatures, {
      #name: name,
      #unit: unit,
      #storehouse: storeroom,
      #description: description,
    });
    // возвращаем созданную группу
    return Nomenclatures.fromJson(data);
  }
}
