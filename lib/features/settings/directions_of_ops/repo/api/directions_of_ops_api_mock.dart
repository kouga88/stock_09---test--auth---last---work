// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:pronet_storeroom_v_01/servises/api_mocker/api_mocker.dart';

import 'i_directions_of_ops_api.dart';
import 'package:get_it/get_it.dart';

class DirectionsOpsApiMock implements IDirectionsOpsApi {
  final apiMocker = GetIt.I<ApiMocker>();

  @override
  Future<(bool, String, dynamic)> getDirectionsOpsShort(
      {required String token}) async {
    String jsonString = await apiMocker.getJson('get_directionsOps_short');
    var data = jsonDecode(jsonString);

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> getDirectionsOpsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? searchText,
  }) async {
    String jsonString = await apiMocker.getJson('get_directionsOps');
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
  Future<(bool, String, dynamic)> createDirectionsOps({
    required String token,
    required String name,
    required String description,
  }) async {
    String jsonString = await apiMocker.getJson('create_directionsOps_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;

    data['description'] = description;
    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> editDirectionsOps({
    required String token,
    required int id,
    required String? name,
    required String? description,
  }) async {
    String jsonString = await apiMocker.getJson('edit_directionsOps_ok');
    var data = jsonDecode(jsonString);
    data['name'] = name;
    data['description'] = description;

    return (false, '', data);
  }

  @override
  Future<(bool, String, dynamic)> deleteDirectionsOps({
    required String token,
    required int id,
  }) async {
    return (false, '', 'null');
  }

  @override
  Future<(bool, String, dynamic)> getDirectionsOpsDetail({
    required String token,
    required int id,
  }) async {
    throw Exception('Not implemented');
  }
}
