// ignore_for_file: non_constant_identifier_names

abstract class IMissionOperationsApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getMissionOperationsShort(
      {required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getMissionOperationsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createMissionOperations({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getMissionOperationsDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteMissionOperations({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editMissionOperations({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
