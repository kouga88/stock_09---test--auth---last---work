// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/api/i_nomenclatueres_group_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group_short.dart';

import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class NomenclaturesGroupRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final nomenclaturesGroupApi = GetIt.I<INomenclaturesGroupApi>();

  // получить список групп
  Future<List<NomenclaturesGroupShort>> getNomenclaturesGroupsShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesGroupApi.getNomenclaturesGroupShort, {});

    List<NomenclaturesGroupShort> list = [];
    for (final nomenclaturesGroup in data['results']) {
      list.add(NomenclaturesGroupShort.fromJson(nomenclaturesGroup));
    }

    return list;
  }

  Future<(List<NomenclaturesGroup>, int)> getNomenclaturesGroupList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesGroupApi.getNomenclaturesGroupList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<NomenclaturesGroup> list = [];
    for (final nomenclaturesGroup in data['results']) {
      list.add(NomenclaturesGroup.fromJson(nomenclaturesGroup));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<NomenclaturesGroup> getNomenclaturesGroupDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesGroupApi.getNomenclaturesGroupDetail, {#id: id});
    return NomenclaturesGroup.fromJson(data);
  }

  // изменить группу
  Future<NomenclaturesGroup> editNomenclaturesGroupRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesGroupApi.editNomenclaturesGroup, {
      #id: id,
      #name: name,
      #description: description,
    });

    return NomenclaturesGroup.fromJson(data);
  }

  // удаление группы
  Future<void> deleteNomenclaturesGroup({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesGroupApi.deleteNomenclaturesGroup, {#id: id});
  }

  // создать группу
  Future<NomenclaturesGroup> createNewNomenclaturesGroup({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        nomenclaturesGroupApi.createNomenclaturesGroup, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return NomenclaturesGroup.fromJson(data);
  }
}
