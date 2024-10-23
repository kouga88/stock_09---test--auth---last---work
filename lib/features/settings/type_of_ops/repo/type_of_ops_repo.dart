import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/api/i_type_of_ops_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/models/type_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/models/type_of_ops_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class TypeOpsRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final typeOpsApi = GetIt.I<ITypeOpsApi>();

  // получить список групп
  Future<List<TypeOpsShort>> getTypeOpssShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeOpsApi.getTypeOpsShort, {});

    List<TypeOpsShort> list = [];
    for (final typeOps in data['results']) {
      list.add(TypeOpsShort.fromJson(typeOps));
    }

    return list;
  }

  Future<(List<TypeOps>, int)> getTypeOpsList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeOpsApi.getTypeOpsList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<TypeOps> list = [];
    for (final typeOps in data['results']) {
      list.add(TypeOps.fromJson(typeOps));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<TypeOps> getTypeOpsDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeOpsApi.getTypeOpsDetail, {#id: id});
    return TypeOps.fromJson(data);
  }

  // изменить группу
  Future<TypeOps> editTypeOpsRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeOpsApi.editTypeOps, {
      #id: id,
      #name: name,
      #description: description,
    });

    return TypeOps.fromJson(data);
  }

  // удаление группы
  Future<void> deleteTypeOps({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeOpsApi.deleteTypeOps, {#id: id});
  }

  // создать группу
  Future<TypeOps> createNewTypeOps({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        typeOpsApi.createTypeOps, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return TypeOps.fromJson(data);
  }
}
