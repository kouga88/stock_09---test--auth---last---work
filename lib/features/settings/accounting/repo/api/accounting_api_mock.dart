// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_accounting_api.dart';
import 'package:get_it/get_it.dart';

class AccountingApiMock implements IAccountingApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getAccountingShort(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('get_accounting_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getAccountingList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_accounting');
    var data = jsonDecode(jsonString);

    data['page'] = page;
    data['page_size'] = page_size;
    data['count'] = (data['results'] as List<dynamic>).length;

    int i = 0;
    data['results'].removeWhere((item) {
      i++;
      return i > page_size;
    });

    data['results']
        .sort((a, b) => (a['name'] ?? '').compareTo(b['name'] ?? ''));
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> createAccounting({
    required String token,
    required String name,
    required String number,
  }) async {
    String jsonString = await apiMocker.getJson('create_accounting_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['number'] = number;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editAccounting({
    required String token,
    required int id,
    required String? name,
    required String? number,
  }) async {
    String jsonString = await apiMocker.getJson('edit_accounting_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['number'] = number;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteAccounting({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getAccountingDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
