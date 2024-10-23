import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/api/i_reserves_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

class ReservesApiMock implements IReservesApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getReservesShort(
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
  Future<(bool, String, dynamic)> getReservesList({
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
  Future<(bool, String, dynamic)> createReserves({
    required String token,
    required dynamic name,
    required dynamic description,
    required StoreroomShort? storeroom,
    required bool? status,
  }) async {
    // получаем список
    final String response = await apiMocker.getJson('create_storeroom_ok');
    final data = await json.decode(response);

    // проставляем данные
    data['name'] = name;
    data['description'] = description;
    data['storeroom'] = storeroom;
    data['status'] = status;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editReserves({
    required String token,
    required int id,
    required String name,
    required String description,
    required StoreroomShort? storeroom,
    required bool? status, // Может быть null
  }) async {
    // получаем список
    final String response = await apiMocker.getJson('edit_storeroom_ok');
    final data = await json.decode(response);
    // проставляем данные
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['storeroom'] = storeroom;
    data['status'] = status;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteReserves(
      {required String token, required int id}) async {
    // возвращаем результат
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getReservesDetail(
      {required String token, required int id}) async {
    throw Exception('');
  }
}
