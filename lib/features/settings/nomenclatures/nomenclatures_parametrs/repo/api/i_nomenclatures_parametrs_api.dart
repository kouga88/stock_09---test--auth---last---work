// ignore_for_file: non_constant_identifier_names

import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';

abstract class INomenclaturesParametrsApi {
  // получение списка резервeй короткий (для выпадающих списков)
  Future<(bool, String, dynamic)> getNomenclaturesParametrsShort(
      {required String token});

  Future<(bool, String, dynamic)> getParamsForNom({required String token});

// получение списка резервeй полный
  Future<(bool, String, dynamic)> getNomenclaturesParametrsList({
    required String token,
    required int page_size,
    required int page,
    String? searchText,
  });

// получение детальной информации о резервe
  Future<(bool, String, dynamic)> getNomenclaturesParametrsDetail(
      {required String token, required int id});

// редактирование резерва
  Future<(bool, String, dynamic)> editNomenclaturesParametrs({
    required String token,
    required int id,
    required String name,
    required UnitShort? unit,
    required String description,
  });

// удаление резерва
  Future<(bool, String, dynamic)> deleteNomenclaturesParametrs({
    required String token,
    required int id,
  });

// создание нового резерва
  Future<(bool, String, dynamic)> createNomenclaturesParametrs({
    required String token,
    required dynamic name,
    required UnitShort? unit,
    required dynamic description,
  });
}
