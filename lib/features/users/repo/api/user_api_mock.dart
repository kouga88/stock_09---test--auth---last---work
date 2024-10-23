// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/api/i_user_api.dart';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

class UserApiMock implements IUserApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getUserShort(
      {required String token, bool? is_staff}) async {
    String jsonString = await apiMocker.getJson('get_user_short');
    var data = jsonDecode(jsonString);
    data.sort((a, b) {
      int res = (a['firstname'] ?? '').compareTo(b['firstname'] ?? '');
      return res;
    });
    return (false, '', data);
  }

  // вернуть список пользователей
  @override
  Future<(bool, String, dynamic)> getUserList(
      {required String? token,
      required int? page_size,
      required int? page,
      String? searchText,
      bool? is_staff,
      bool? is_active,
      bool? is_superuser}) async {
    String jsonString = await apiMocker.getJson('get_user');
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
      int res = (a['first_name'] ?? '').compareTo(b['first_name'] ?? '');
      return res;
    });
    // возврат результата
    return (false, '', data);
  }

// вернуть список пользователей
  @override
  Future<(bool, String, dynamic)> searchUser({
    required String? token,
    required int? page_size,
    required int? page,
    dynamic params,
  }) async {
    String jsonString = await apiMocker.getJson('get_user');
    var data = jsonDecode(jsonString);
    // устанавливаем лимит

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> createUser({
    required String token,
    required dynamic first_name,
    required dynamic last_name,
    required dynamic username,
    required String password,
    required String department,
    required dynamic email,
    required dynamic telegram_id,
    required bool is_superuser,
    required bool is_staff,
    // required bool is_active,
    required List groups,
    required String organization,
    required dynamic surname,
  }) async {
    // получаем список
    final String response = await apiMocker.getJson('create_user_ok');
    final data = await json.decode(response);
    final int telega = int.parse(telegram_id);
    final List gropdata = groups.map((e) => e.name).toList();
    // проставляем данные
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['username'] = username;
    data['password'] = password;
    data['department'] = department;
    data['is_superuser'] = is_superuser;
    data['is_staff'] = is_staff;
    // data['is_active'] = is_active;
    data['email'] = email;
    data['groups'] = gropdata;
    data['organization'] = organization;
    data['surname'] = surname;
    data['telegram_id'] = telega;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editUser({
    required String token,
    required int id,
    required String first_name,
    required String last_name,
    required String username,
    dynamic email, // Может быть null
    bool? is_staff, // Может быть null
    // bool? is_active, // Может быть null
    bool? is_superuser, // Может быть null
    dynamic telegram_id, // Может быть null
    dynamic organization, // Может быть null
    dynamic surname, // Может быть null
    dynamic department, // Может быть null
    List? groups,
  }) async {
    // получаем список
    final String response = await apiMocker.getJson('edit_user_ok');
    final data = await json.decode(response);
    // проставляем данные
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['id'] = id;
    data['username'] = username;
    data['surname'] = surname;
    data['organization'] = organization;
    data['telegram_id'] = telegram_id;
    data['department'] = department;
    data['groups'] = groups;
    // возвращаем результат
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteUser(
      {required String token, required int id}) async {
    // возвращаем результат
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getUserDetail(
      {required String token, required int id}) async {
    throw Exception('');
  }

  @override
  Future<(bool, String, dynamic)> getGroupDetail(
      {required String token, required int id}) async {
    throw Exception('');
  }

  @override
  Future<(bool, String, dynamic)> changeUserPassword(
      {required String token,
      required int id,
      required String password}) async {
    // возвращаем результат
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> createNewGroup(
      {required String token, required String name}) async {
    throw Exception('');
  }

  @override
  Future<(bool, String, dynamic)> getGroupsShort(
      {required String token}) async {
    throw Exception('getGroupsShort еще не реализовано!');
  }

  @override
  Future<(bool, String, dynamic)> editGroup(
      {required String token, required int id, required String name}) async {
    throw Exception('');
  }

  @override
  Future<(bool, String, dynamic)> deleteGroup(
      {required String token, required int id}) async {
    throw Exception('');
  }
}
