abstract class IUnitsApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getUnitShort({required String token});

  // Получить список ед. измерения
  Future<(bool, String, dynamic)> getUnitsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
  });

  // Создать ед. измерения
  Future<(bool, String, dynamic)> createUnits({
    required String token,
    required String full_name,
    required String short_name,
    required String description,
  });

  // Получить детальную информацию о ед. измерения
  Future<(bool, String, dynamic)> getUnitsDetail({
    required String token,
    required int id,
  });

  // Удалить ед. измерения
  Future<(bool, String, dynamic)> deleteUnits({
    required String token,
    required int id,
  });

  // Редактировать ед. измерения
  Future<(bool, String, dynamic)> editUnits({
    required String token,
    required int id,
    required String full_name,
    required String short_name,
    required String description,
  });
}
