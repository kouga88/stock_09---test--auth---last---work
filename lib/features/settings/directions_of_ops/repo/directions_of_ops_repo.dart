// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/api/i_directions_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/models/directions_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/models/directions_of_ops_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class DirectionsOpsRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final directionsOpsApi = GetIt.I<IDirectionsOpsApi>();

  // получить список групп
  Future<List<DirectionsOpsShort>> getDirectionsOpssShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        directionsOpsApi.getDirectionsOpsShort, {});

    List<DirectionsOpsShort> list = [];
    for (final directionsOps in data['results']) {
      list.add(DirectionsOpsShort.fromJson(directionsOps));
    }

    return list;
  }

  Future<(List<DirectionsOps>, int)> getDirectionsOpsList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        directionsOpsApi.getDirectionsOpsList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<DirectionsOps> list = [];
    for (final directionsOps in data['results']) {
      list.add(DirectionsOps.fromJson(directionsOps));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<DirectionsOps> getDirectionsOpsDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        directionsOpsApi.getDirectionsOpsDetail, {#id: id});
    return DirectionsOps.fromJson(data);
  }

  // изменить группу
  Future<DirectionsOps> editDirectionsOpsRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        directionsOpsApi.editDirectionsOps, {
      #id: id,
      #name: name,
      #description: description,
    });

    return DirectionsOps.fromJson(data);
  }

  // удаление группы
  Future<void> deleteDirectionsOps({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        directionsOpsApi.deleteDirectionsOps, {#id: id});
  }

  // создать группу
  Future<DirectionsOps> createNewDirectionsOps({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        directionsOpsApi.createDirectionsOps, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return DirectionsOps.fromJson(data);
  }
}
