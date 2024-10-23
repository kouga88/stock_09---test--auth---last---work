// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/api/i_user_api.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/group.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

class UserApi implements IUserApi {
  final dio = Dio();

  UserApi() {
    dio.options.baseUrl = SettingsRepo.apiHost;
  }

  @override
  Future<(bool, String, dynamic)> getUserShort(
      {required String token, bool? is_staff}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    final response = await dio.get(
        '/api/v1/employees/?view_fields=["id","first_name","last_name", "surname"]');

    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> getUserList({
    required String token,
    required int page_size,
    required int page,
    String? searchText,
    int? id,
    String? username,
    String? first_name,
    String? last_name,
    String? department,
    String? organization,
    String? email,
    int? telegram_id,
    bool? is_staff,
    bool? is_active,
    bool? is_superuser,
    List<Group>? groups,
  }) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    // List<dynamic> viewFields = [];

    Map<String, dynamic> params = {
      'page_size': page_size,
      'page': page,
      // 'search': searchText ?? '',
    };

    // if (first_name != null && first_name.isNotEmpty) {
    //   viewFields.add(first_name);
    // }
    // if (first_name != null && first_name.isNotEmpty) {
    //   viewFields.add(first_name);
    // }
    // if (last_name != null && last_name.isNotEmpty) {
    //   viewFields.add(last_name);
    // }
    // if (username != null && username.isNotEmpty) {
    //   viewFields.add(username);
    // }
    // if (telegram_id != 0 && telegram_id != null) {
    //   viewFields.add(telegram_id);
    // }
    // if (email != null && email.isNotEmpty) {
    //   viewFields.add(email);
    // }
    // if (department != null && department.isNotEmpty) {
    //   viewFields.add(department);
    // }

    // if (organization != null && organization.isNotEmpty) {
    //   viewFields.add(organization);
    // }

    // if (groups != null && groups.isNotEmpty) {
    //   viewFields.add(groups);
    // }

    // if (is_staff != null && is_staff) {
    //   viewFields.add(is_staff);
    // }

    // if (is_active != null && is_active) {
    //   viewFields.add(is_active);
    // }

    // if (is_superuser != null && is_superuser) {
    //   viewFields.add(is_superuser);
    // }

    // if (viewFields.isNotEmpty) {
    //   params['view_fields'] = viewFields;
    // }
    if (searchText != null && searchText.isNotEmpty) {
      params['filters'] = '{"and":{"last_name__contains":"$searchText" }}';
    }

    // делаем сам запрос
    final response = await dio.get(
      '/api/v1/employees/',
      queryParameters: params,
    );

    //
    // возвращаем результат
    return (false, '', response.data);
  }

  @override
  Future<(bool, String, dynamic)> searchUser(
      {required String token,
      required int page_size,
      required int page,
      dynamic params}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';

    // делаем сам запрос
    final response = await dio.post(
      '/api/v1/employees/search/',
      queryParameters: params,
    );

    //

    return (false, '', response.data);
  }

// создаение пользователя
  @override
  Future<(bool, String, dynamic)> createUser({
    required String token,
    required dynamic first_name,
    required dynamic last_name,
    required String password,
    required dynamic username,
    required String department,
    required dynamic telegram_id,
    required dynamic email,
    required bool is_superuser,
    required bool is_staff,
    // required bool is_active,
    List? groups,
    required String organization,
    required dynamic surname,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      // dio.options.contentType = Headers.formUrlEncodedContentType;

      final List? gropdata = groups?.map((e) => e.name).toList();
      final response = await dio.post('/api/v1/employees/',
          data: json.encode({
            'username': username,
            'password': password,
            'email': email,
            'first_name': first_name,
            'last_name': last_name,
            'department': department,
            'organization': organization,
            'telegram_id': telegram_id,
            'groups': gropdata,
            'is_staff': is_staff,
            // 'is_active': is_active,
            'is_superuser': is_superuser,
          }));

      if (response.statusCode == 201) {
        return (true, '', response.data);
      } else {
        return (false, 'Failed to create user', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

// удаление пользователя
  @override
  Future<(bool, String, dynamic)> deleteUser(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.delete('/api/v1/employees/$id/');

      if (response.statusCode == 204) {
        return (true, '', null);
      } else {
        return (false, 'Failed to delete user', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

// реадактирование пользователя
  @override
  Future<(bool, String, dynamic)> editUser({
    required String token,
    required int id,
    required String first_name,
    required String last_name,
    required String username,
    dynamic email,
    bool? is_staff,
    // bool? is_active,
    bool? is_superuser,
    dynamic telegram_id,
    dynamic organization,
    dynamic department,
    dynamic surname,
    List? groups,
  }) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.patch('/api/v1/employees/$id/',
          data: json.encode({
            'first_name': first_name,
            'last_name': last_name,
            'surname': surname,
            'is_staff': is_staff,
            'is_superuser': is_superuser,
            // 'is_active': is_active,
            'username': username,
            'telegram_id': telegram_id,
            'organization': organization,
            'department': department,
            'groups': groups,
          }));

      if (response.statusCode == 200) {
        return (true, '', response.data);
      } else {
        return (false, 'Failed to edit user', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

  @override
  Future<(bool, String, dynamic)> getUserDetail(
      {required String token, required int id}) async {
    try {
      dio.options.headers["Authorization"] = 'Token $token';
      final response = await dio.get('/api/v1/employees/$id/');

      if (response.statusCode == 200) {
        return (true, '', response.data);
      } else {
        return (false, 'Failed to fetch user detail', null);
      }
    } catch (e) {
      return (false, e.toString(), null);
    }
  }

  @override
  Future<(bool, String, dynamic)> changeUserPassword(
      {required String token,
      required int id,
      required String password}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';
    // делаем сам запрос
    final response = await dio.patch(
      '/api/v1/employees/{$id}/?view_fields=["$password"]',
    ); // queryParameters: {"password_new": password}
    // возвращаем результат
    return (false, '', response.data);
  }

  // вернуть список групп
  @override
  Future<(bool, String, dynamic)> getGroupsShort(
      {required String token}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';
    // делаем сам запрос
    final response = await dio.get('/api/v1/groups-of-employee/');
    // возвращаем результат
    return (false, '', response.data);
  }

  // вернуть группу
  @override
  Future<(bool, String, dynamic)> getGroupDetail(
      {required String token, required int id}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';
    // делаем сам запрос
    final response = await dio.get('/api/v1/groups-of-employee/$id/');
    // возвращаем результат
    return (false, '', response.data);
  }

  // создать новою группу
  @override
  Future<(bool, String, dynamic)> createNewGroup(
      {required String token, required String name}) async {
    // устанавливаем параметры запроса
    dio.options.headers["Authorization"] = 'Token $token';
    // делаем сам запрос
    final response =
        await dio.post('/api/v1/groups-of-employee/', data: json.encode(name));

    return (false, '', response.data);
  }

  // удалить группу
  @override
  Future<(bool, String, dynamic)> deleteGroup(
      {required String token, required int id}) async {
    // устанавливаем параметры запроса
    dio.options.headers["authorization"] = 'Bearer $token';
    // делаем сам запрос
    final response = await dio.delete('/api/v1/groups-of-employee/$id/');
    // возвращаем результат
    return (false, '', response.data);
  }

  // изменить группу
  @override
  Future<(bool, String, dynamic)> editGroup(
      {required String token, required int id, required String name}) async {
    // устанавливаем параметры запроса
    dio.options.headers["authorization"] = 'Bearer $token';
    // делаем сам запрос
    final response =
        await dio.put('/api/v1/groups-of-employee/$id/', queryParameters: {
      "name": name,
    });
    // возвращаем результат
    return (false, '', response.data);
  }
}
