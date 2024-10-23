// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/api/i_accounting_api.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/models/accounting.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/models/accounting_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class AccountingRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final accountingApi = GetIt.I<IAccountingApi>();

  // получить список групп
  Future<List<AccountingShort>> getAccountingShort() async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        accountingApi.getAccountingShort, {});
    // если получено все без ошибок, то возвращаем ответ
    List<AccountingShort> list = [];
    for (final accounting in data['results']) {
      list.add(AccountingShort.fromJson(accounting));
    }

    return list;
  }

  Future<(List<Accounting>, int)> getAccountingList(
      {required int page, required int page_size, String? searchText}) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        accountingApi.getAccountingList,
        {#page: page, #page_size: page_size, #searchText: searchText});
    // если получено все без ошибок, то возвращаем ответ
    List<Accounting> list = [];
    for (final accounting in data['results']) {
      list.add(Accounting.fromJson(accounting));
    }
    return (list, (data['count'] as int));
  }

  // получить детали счетa учета
  Future<Accounting> getAccountingDetail(int id) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        accountingApi.getAccountingDetail, {#id: id});
    return Accounting.fromJson(data);
  }

  // изменить счет учета
  Future<Accounting> editAccountingRepo({
    required int id,
    required String? name,
    required String? number,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        accountingApi.editAccounting, {
      #id: id,
      #name: name,
      #number: number,
    });

    return Accounting.fromJson(data);
  }

  // удаление счет учета
  Future<void> deleteAccounting({
    required int id,
  }) async {
    // делаем запрос апи
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        accountingApi.deleteAccounting, {#id: id});
  }

  // создать счет учета
  Future<Accounting> createNewAccounting({
    required String name,
    required String number,
  }) async {
    // делаем запрос апи
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        accountingApi.createAccounting, {
      #name: name,
      #number: number,
    });
    // возвращаем созданную счет учета
    return Accounting.fromJson(data);
  }
}
