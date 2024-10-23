import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/api/i_type_of_work_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/models/type_of_work.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/models/type_of_work_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class TypeWorkRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final typeWorkApi = GetIt.I<ITypeWorkApi>();

  // получить список групп
  Future<List<TypeWorkShort>> getTypeWorksShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeWorkApi.getTypeWorkShort, {});

    List<TypeWorkShort> list = [];
    for (final typeWork in data['results']) {
      list.add(TypeWorkShort.fromJson(typeWork));
    }

    return list;
  }

  Future<(List<TypeWork>, int)> getTypeWorkList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeWorkApi.getTypeWorkList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<TypeWork> list = [];
    for (final typeWork in data['results']) {
      list.add(TypeWork.fromJson(typeWork));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<TypeWork> getTypeWorkDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeWorkApi.getTypeWorkDetail, {#id: id});
    return TypeWork.fromJson(data);
  }

  // изменить группу
  Future<TypeWork> editTypeWorkRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeWorkApi.editTypeWork, {
      #id: id,
      #name: name,
      #description: description,
    });

    return TypeWork.fromJson(data);
  }

  // удаление группы
  Future<void> deleteTypeWork({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeWorkApi.deleteTypeWork, {#id: id});
  }

  // создать группу
  Future<TypeWork> createNewTypeWork({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeWorkApi.createTypeWork, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return TypeWork.fromJson(data);
  }
}
