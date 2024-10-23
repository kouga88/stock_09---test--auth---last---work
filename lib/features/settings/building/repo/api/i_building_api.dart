// ignore_for_file: non_constant_identifier_names

abstract class IBuildingApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getBuildingShort({required String token});

  // Получить список строительных объектов
  Future<(bool, String, dynamic)> getBuildingList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать строительный объект
  Future<(bool, String, dynamic)> createBuilding({
    required String token,
    required String name,
    required String description,
    required bool status,
  });

  // Получить детальную информацию о строительном объекте
  Future<(bool, String, dynamic)> getBuildingDetail({
    required String token,
    required int id,
  });

  // Удалить строительный объект
  Future<(bool, String, dynamic)> deleteBuilding({
    required String token,
    required int id,
  });

  // Редактировать строительный объект
  Future<(bool, String, dynamic)> editBuilding({
    required String token,
    required int id,
    required String name,
    required String description,
    required bool status,
  });
}
