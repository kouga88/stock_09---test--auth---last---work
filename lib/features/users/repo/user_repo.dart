// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
// import 'package:pronet_storeroom_v_01/features/department/repo/models/department_short.dart';
// import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
// import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_short.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/api/i_user_api.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/group.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_short.dart';

import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class UserRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final userApi = GetIt.I<IUserApi>();

// получение короткого имени пользователя
  Future<List<UserShort>> getUserShort() async {
    //{bool? is_staff}
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.getUserShort, {}); //
    // если получено все без ошибок, то возвращаем ответ
    List<UserShort> list = [];
    for (final user in data['results']) {
      list.add(UserShort.fromJson(user));
    }
    return list;
  }

// получение полного списка пользователя
  Future<(List<User>, int)> getUserList({
    required int page_size,
    required int page,
    String? searchText,
    // bool? is_staff,
    // bool? is_active,
    // bool? is_superuser,
    int? id,
  }) async {
    var data =
        await ApiHelper.apiRequestWithTokenAndCheckErrors(userApi.getUserList, {
      #page_size: page_size,
      #page: page,
      #searchText: searchText,
      // #is_staff: is_staff,
      // #is_active: is_active,
      // #is_superuser: is_superuser
    });
    // если получено все без ошибок, то возвращаем ответ
    List<User> list = [];
    for (final user in data['results']) {
      list.add(User.fromJson(user));
    }
    return (list, (data['count'] as int));
  }

  // создание нового пользователя
  Future<User> createNewUser({
    required String first_name,
    required String last_name,
    required bool is_staff,
    // required bool is_active,
    required bool is_superuser,
    required String organization,
    required String department,
    required List<Group> groups,
    required String username,
    required dynamic telegram_id,
    required dynamic surname,
    required String password,
    required dynamic email,
  }) async {
    // делаем запрос апи
    // final int telega = int.parse(telegram_id);

    var telega;

    if (telegram_id != null) {
      telega = int.parse(telegram_id);
    } else {
      telega = null;
    }

    var data =
        await ApiHelper.apiRequestWithTokenAndCheckErrors(userApi.createUser, {
      #first_name: first_name,
      #last_name: last_name,
      #is_staff: is_staff,
      // #is_active: is_active,
      #is_superuser: is_superuser,
      #organization: organization,
      #telegram_id: telega,
      #password: password,
      #department: department,
      #surname: surname,
      #email: email,
      #groups: groups,
      #username: username
    });

    return User.fromJson(data);
  }

  Future<List<User>> searchUser({
    required int? page,
    required int? page_size,
    required dynamic params,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.searchUser,
        {#params: params, #page: page, #page_size: page_size}); //
    // если получено все без ошибок, то возвращаем ответ
    List<User> list = [];
    for (final user in data['results']) {
      list.add(User.fromJson(user));
    }
    return list;
  }

  // изменить пользователя
  Future<User> editUser({
    required int id,
    required String first_name,
    required String last_name,
    required bool is_staff,
    // required bool is_active,
    required bool is_superuser,
    required String organization,
    required String department,
    required List<Group> groups,
    required String username,
    required dynamic telegram_id,
    required dynamic surname,
    required email,
  }) async {
    // делаем запрос апи
    var data =
        await ApiHelper.apiRequestWithTokenAndCheckErrors(userApi.editUser, {
      #id: id,
      #first_name: first_name,
      #last_name: last_name,
      #is_staff: is_staff,
      // #is_active: is_active,
      #is_superuser: is_superuser,
      #organization: organization,
      #telegram_id: telegram_id,
      #department: department,
      #surname: surname,
      #groups: groups,
      #username: username
    });

    return User.fromJson(data);
  }

  // удаление пользователя
  Future<void> deleteUser({
    required int id,
  }) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.deleteUser, {#id: id});
  }

  // получить пользователя по его id
  Future<User> getUserDetail(int id) async {
    final data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.getUserDetail, {#id: id});
    return User.fromJson(data);
  }

  // изменение пароля
  Future<void> changeUserPassword(
      {required int userId, required String password}) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.changeUserPassword, {#userId: userId, #password: password});
  }

  // получить список групп
  Future<List<Group>> getGroupsShort() async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.getGroupsShort, {});
    // если получено все без ошибок, то возвращаем ответ
    List<Group> list = [];
    for (final group in data['results']) {
      list.add(Group.fromJson(group));
    }

    return list;
  }

  // получить список групп
  Future<List<Group>> getGroupDetail() async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.getGroupsShort, {});
    // если получено все без ошибок, то возвращаем ответ
    List<Group> list = [];
    for (final taskMap in data) {
      list.add(Group.fromJson(taskMap));
    }
    return list;
  }

  // изменить группу
  Future<Group> editGroup({required String name}) async {
    //required int id,
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.editGroup, {#name: name}); //#id: id,
    // возвращаем наряд
    return Group.fromJson(data);
  }

  // удаление группы
  Future<void> deleteGroup({required String name}) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.deleteGroup, {#name: name});
  }

  // создать группы
  Future<Group> createNewGroup({required String name}) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        userApi.createNewGroup, {#name: name});
    // возвращаем наряд
    return Group.fromJson(data);
  }
}
