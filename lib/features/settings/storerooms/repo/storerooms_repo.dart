import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/api/i_storerooms_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class StoreroomRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final storeroomApi = GetIt.I<IStoreroomApi>();

// получение короткого списка складов
  Future<List<StoreroomShort>> getStoreroomShort({
    int? id,
    String? searchText,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        storeroomApi.getStoreroomShort, {}); //
    // если получено все без ошибок, то возвращаем ответ
    List<StoreroomShort> list = [];
    for (final storeroom in data['results']) {
      list.add(StoreroomShort.fromJson(storeroom));
    }
    return (list);
  }

// получение полного списка складов
  Future<(List<Storeroom>, int)> getStoreroomList({
    required int page_size,
    required int page,
    int? id,
    String? searchText,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        storeroomApi.getStoreroomList,
        {#page_size: page_size, #page: page, #searchText: searchText});

    List<Storeroom> list = [];
    for (final storeroom in data['results']) {
      list.add(Storeroom.fromJson(storeroom) as Storeroom);
    }
    return (list, (data['count'] as int));
  }

  // создать  склад
  Future<Storeroom> createNewStoreroom({
    required String name,
    required String description,
    required String organization,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        storeroomApi.createStoreroom, {
      #name: name,
      #organization: organization,
      #description: description,
    });

    return Storeroom.fromJson(data);
  }

  // изменить склад
  Future<Storeroom> editStoreroom({
    required int id,
    required String name,
    required String description,
    required String organization,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        storeroomApi.editStoreroom, {
      #id: id,
      #name: name,
      #description: description,
      #organization: organization,
    });

    return Storeroom.fromJson(data);
  }

  // удаление склад
  Future<void> deleteStoreroom({
    required int id,
  }) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        storeroomApi.deleteStoreroom, {#id: id});
  }

  // получить склад по его id
  Future<Storeroom> getStoreroomDetail(int id) async {
    final data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        storeroomApi.getStoreroomDetail, {#id: id});
    return Storeroom.fromJson(data);
  }
}
