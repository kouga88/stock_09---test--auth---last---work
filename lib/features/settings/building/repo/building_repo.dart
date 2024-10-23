// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/api/i_building_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/models/building.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/models/building_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class BuildingRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final buildingApi = GetIt.I<IBuildingApi>();

  // получить список групп
  Future<List<BuildingShort>> getBuildingsShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        buildingApi.getBuildingShort, {});

    List<BuildingShort> list = [];
    for (final building in data['results']) {
      list.add(BuildingShort.fromJson(building));
    }

    return list;
  }

  Future<(List<Building>, int)> getBuildingList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        buildingApi.getBuildingList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<Building> list = [];
    for (final building in data['results']) {
      list.add(Building.fromJson(building));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<Building> getBuildingDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        buildingApi.getBuildingDetail, {#id: id});
    return Building.fromJson(data);
  }

  // изменить группу
  Future<Building> editBuildingRepo({
    required int id,
    required String? name,
    required String? description,
    required bool? status,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        buildingApi.editBuilding, {
      #id: id,
      #name: name,
      #description: description,
      #status: status,
    });

    return Building.fromJson(data);
  }

  // удаление группы
  Future<void> deleteBuilding({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        buildingApi.deleteBuilding, {#id: id});
  }

  // создать группу
  Future<Building> createNewBuilding({
    required String name,
    required String description,
    required bool? status,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        buildingApi.createBuilding, {
      #name: name,
      #description: description,
      #status: status,
    });
    // возвращаем созданную группу
    return Building.fromJson(data);
  }
}
