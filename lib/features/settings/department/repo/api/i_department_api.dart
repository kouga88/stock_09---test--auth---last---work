// ignore_for_file: non_constant_identifier_names

abstract class IDepartmentApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getDepartmentShort({required String token});

  // Получить список групп номенклатуры
  Future<(bool, String, dynamic)> getDepartmentList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать группу номенклатуры
  Future<(bool, String, dynamic)> createDepartment({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о группе номенклатуры
  Future<(bool, String, dynamic)> getDepartmentDetail({
    required String token,
    required int id,
  });

  // Удалить группу номенклатуры
  Future<(bool, String, dynamic)> deleteDepartment({
    required String token,
    required int id,
  });

  // Редактировать группу номенклатуры
  Future<(bool, String, dynamic)> editDepartment({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
