abstract class ISuppliersApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getSuppliersShort({required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getSuppliersList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createSuppliers({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getSuppliersDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteSuppliers({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editSuppliers({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
