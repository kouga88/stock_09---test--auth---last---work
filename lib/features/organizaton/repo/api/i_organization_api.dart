// ignore_for_file: non_constant_identifier_names

abstract class IOrganizationApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getOrganizationShort({required String token});

  // Получить список подразделений
  Future<(bool, String, dynamic)> getOrganizationList({
    required String token,
    required int page,
    required int page_size,
    // required String? search,
  });

  // Создать подразделение
  Future<(bool, String, dynamic)> createOrganization({
    required String token,
    required String name,
    required String description,
  });

  // Получить детальную информацию о подразделении
  Future<(bool, String, dynamic)> getOrganizationDetail({
    required String token,
    required int id,
  });

  // Удалить подразделение
  Future<(bool, String, dynamic)> deleteOrganization({
    required String token,
    required int id,
  });

  // Редактировать подразделение
  Future<(bool, String, dynamic)> editOrganization({
    required String token,
    required int id,
    required String name,
    required String description,
  });
}
