import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/api/i_reserves_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class ReservesRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final reservesApi = GetIt.I<IReservesApi>();

// получение короткого имени пользователя
  Future<List<ReservesShort>> getReservesShort({
    int? id,
    String? searchText,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getReservesShort, {}); //
    // если получено все без ошибок, то возвращаем ответ
    List<ReservesShort> list = [];
    for (final reserves in data['results']) {
      list.add(ReservesShort.fromJson(reserves));
    }
    return (list);
  }

// получение полного списка пользователя
  Future<(List<Reserves>, int)> getReservesList({
    required int page_size,
    required int page,
    int? id,
    String? searchText,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getReservesList,
        {#page_size: page_size, #page: page, #searchText: searchText});

    List<Reserves> list = [];
    for (final reserves in data['results']) {
      list.add(Reserves.fromJson(reserves) as Reserves);
    }

    return (list, (data['count'] as int));
  }

  // создание нового пользователя
  Future<Reserves> createNewReserves(
      {required String name,
      required String description,
      required StoreroomShort? storeroom,
      required bool? status}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.createReserves, {
      #name: name,
      #description: description,
      #storeroom: storeroom,
      #status: status,
    });

    return Reserves.fromJson(data);
  }

  // изменить пользователя
  Future<Reserves> editReserves({
    required int id,
    required String name,
    required String description,
    required StoreroomShort? storeroom,
    required bool? status,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.editReserves, {
      #id: id,
      #name: name,
      #description: description,
      #storeroom: storeroom,
      #status: status,
    });

    return Reserves.fromJson(data);
  }

  // удаление пользователя
  Future<void> deleteReserves({
    required int id,
  }) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.deleteReserves, {#id: id});
  }

  // получить пользователя по его id
  Future<Reserves> getReservesDetail(int id) async {
    final data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        reservesApi.getReservesDetail, {#id: id});
    return Reserves.fromJson(data);
  }
}
