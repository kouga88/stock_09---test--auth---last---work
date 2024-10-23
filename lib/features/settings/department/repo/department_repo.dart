// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/api/i_department_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class DepartmentRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final departmentApi = GetIt.I<IDepartmentApi>();

  // получить список групп
  Future<List<DepartmentShort>> getDepartmentsShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        departmentApi.getDepartmentShort, {});

    List<DepartmentShort> list = [];
    for (final department in data['results']) {
      list.add(DepartmentShort.fromJson(department));
    }

    return list;
  }

  Future<(List<Department>, int)> getDepartmentList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        departmentApi.getDepartmentList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<Department> list = [];
    for (final department in data['results']) {
      list.add(Department.fromJson(department));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<Department> getDepartmentDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        departmentApi.getDepartmentDetail, {#id: id});
    return Department.fromJson(data);
  }

  // изменить группу
  Future<Department> editDepartmentRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        departmentApi.editDepartment, {
      #id: id,
      #name: name,
      #description: description,
    });

    return Department.fromJson(data);
  }

  // удаление группы
  Future<void> deleteDepartment({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        departmentApi.deleteDepartment, {#id: id});
  }

  // создать группу
  Future<Department> createNewDepartment({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        departmentApi.createDepartment, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return Department.fromJson(data);
  }
}
