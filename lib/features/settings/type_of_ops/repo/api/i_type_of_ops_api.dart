abstract class ITypeOpsApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getTypeOpsShort({required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getTypeOpsList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createTypeOps({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getTypeOpsDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteTypeOps({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editTypeOps({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
