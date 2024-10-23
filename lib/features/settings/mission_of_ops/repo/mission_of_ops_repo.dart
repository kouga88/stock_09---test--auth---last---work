// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/api/i_mission_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/models/mission_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/models/mission_of_ops_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class MissionOperationsRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final missionOperationsApi = GetIt.I<IMissionOperationsApi>();

  // получить список групп
  Future<List<MissionOperationsShort>> getMissionOperationssShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        missionOperationsApi.getMissionOperationsShort, {});

    List<MissionOperationsShort> list = [];
    for (final missionOperations in data['results']) {
      list.add(MissionOperationsShort.fromJson(missionOperations));
    }

    return list;
  }

  Future<(List<MissionOperations>, int)> getMissionOperationsList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        missionOperationsApi.getMissionOperationsList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<MissionOperations> list = [];
    for (final missionOperations in data['results']) {
      list.add(MissionOperations.fromJson(missionOperations));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<MissionOperations> getMissionOperationsDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        missionOperationsApi.getMissionOperationsDetail, {#id: id});
    return MissionOperations.fromJson(data);
  }

  // изменить группу
  Future<MissionOperations> editMissionOperationsRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        missionOperationsApi.editMissionOperations, {
      #id: id,
      #name: name,
      #description: description,
    });

    return MissionOperations.fromJson(data);
  }

  // удаление группы
  Future<void> deleteMissionOperations({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        missionOperationsApi.deleteMissionOperations, {#id: id});
  }

  // создать группу
  Future<MissionOperations> createNewMissionOperations({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        missionOperationsApi.createMissionOperations, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return MissionOperations.fromJson(data);
  }
}
