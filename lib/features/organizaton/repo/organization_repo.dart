// ignore_for_file: non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/api/i_organization_api.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_short.dart';
import 'package:pronet_storeroom_v_01/helpers/api_helper.dart';
import 'package:pronet_storeroom_v_01/servises/token_saver/i_token_saver.dart';

class OrganizationRepo {
  final tokenSaver = GetIt.I<ITokenSaver>();
  final organizationApi = GetIt.I<IOrganizationApi>();

  // получить список групп
  Future<List<OrganizationShort>> getOrganizationsShort() async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        organizationApi.getOrganizationShort, {});

    List<OrganizationShort> list = [];
    for (final organization in data['results']) {
      list.add(OrganizationShort.fromJson(organization));
    }

    return list;
  }

  // получить список организаций
  Future<(List<Organization>, int)> getOrganizationList({
    required int page,
    required int page_size,
    required String search,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        organizationApi.getOrganizationList, {
      #page: page,
      #page_size: page_size,
    });

    List<Organization> list = [];
    for (final organization in data['results']) {
      list.add(Organization.fromJson(organization));
    }
    return (list, (data['count'] as int));
  }

  // получить детали организации
  Future<Organization> getOrganizationDetail(int id) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        organizationApi.getOrganizationDetail, {#id: id});
    return Organization.fromJson(data);
  }

  // изменить организацию
  Future<Organization> editOrganizationRepo({
    required int id,
    required String? name,
    required String? description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        organizationApi.editOrganization, {
      #id: id,
      #name: name,
      #description: description,
    });

    return Organization.fromJson(data);
  }

  // удаление организации
  Future<void> deleteOrganization({
    required int id,
  }) async {
    await ApiHelper.apiRequestWithTokenAndCheckErrors(
        organizationApi.deleteOrganization, {#id: id});
  }

  // создать организацию
  Future<Organization> createNewOrganization({
    required String name,
    required String description,
  }) async {
    var data = await ApiHelper.apiRequestWithTokenAndCheckErrors(
        organizationApi.createOrganization, {
      #name: name,
      #description: description,
    });
    // возвращаем созданную организацию
    return Organization.fromJson(data);
  }
}
