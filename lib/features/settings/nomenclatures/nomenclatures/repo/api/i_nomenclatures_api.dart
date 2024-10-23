// ignore_for_file: non_constant_identifier_names

import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';

abstract class INomenclaturesApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getNomenclaturesShort(
      {required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getNomenclaturesList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createNomenclatures({
    required String token,
    required String name,
    required UnitShort? unit,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getNomenclaturesDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteNomenclatures({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editNomenclatures({
    required String token,
    required int id,
    required String name,
    required UnitShort? unit,
    required String description,
  });
}
