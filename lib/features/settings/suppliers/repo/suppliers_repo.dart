import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/api/i_suppliers_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class SuppliersRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final suppliersApi = GetIt.I<ISuppliersApi>();

  // получить список групп
  Future<List<SuppliersShort>> getSupplierssShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        suppliersApi.getSuppliersShort, {});

    List<SuppliersShort> list = [];
    for (final suppliers in data['results']) {
      list.add(SuppliersShort.fromJson(suppliers));
    }

    return list;
  }

  Future<(List<Suppliers>, int)> getSuppliersList(
      {required int page, required int page_size, String? searchText}) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        suppliersApi.getSuppliersList,
        {#page: page, #page_size: page_size, #searchText: searchText});

    List<Suppliers> list = [];
    for (final suppliers in data['results']) {
      list.add(Suppliers.fromJson(suppliers));
    }
    return (list, (data['count'] as int));
  }

  // получить детали группы
  Future<Suppliers> getSuppliersDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        suppliersApi.getSuppliersDetail, {#id: id});
    return Suppliers.fromJson(data);
  }

  // изменить группу
  Future<Suppliers> editSuppliersRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        suppliersApi.editSuppliers, {
      #id: id,
      #name: name,
      #description: description,
    });

    return Suppliers.fromJson(data);
  }

  // удаление группы
  Future<void> deleteSuppliers({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        suppliersApi.deleteSuppliers, {#id: id});
  }

  // создать группу
  Future<Suppliers> createNewSuppliers({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        suppliersApi.createSuppliers, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную группу
    return Suppliers.fromJson(data);
  }
}
