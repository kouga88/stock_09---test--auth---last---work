abstract class ITypeWorkApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getTypeWorkShort({required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getTypeWorkList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createTypeWork({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getTypeWorkDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteTypeWork({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editTypeWork({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
