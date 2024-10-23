// ignore_for_file: non_constant_identifier_names

abstract class IDirectionsOpsApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getDirectionsOpsShort(
      {required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getDirectionsOpsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createDirectionsOps({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getDirectionsOpsDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteDirectionsOps({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editDirectionsOps({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
