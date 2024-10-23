// ignore_for_file: non_constant_identifier_names

abstract class IAccountingApi {
  // Получить краткую информацию о подразделениях
  Future<(bool, String, dynamic)> getAccountingShort({required String token});

  // Получить список счетов учета
  Future<(bool, String, dynamic)> getAccountingList({
    required String token,
    required int page,
    required int page_size,
    String? searchText,
    // required String? search,
  });

  // Создать счет учета
  Future<(bool, String, dynamic)> createAccounting({
    required String token,
    required String name,
    required String number,
  });

  // Получить детальную информацию о счетe учета
  Future<(bool, String, dynamic)> getAccountingDetail({
    required String token,
    required int id,
  });

  // Удалить счет учета
  Future<(bool, String, dynamic)> deleteAccounting({
    required String token,
    required int id,
  });

  // Редактировать счет учета
  Future<(bool, String, dynamic)> editAccounting({
    required String token,
    required int id,
    required String name,
    required String number,
  });
}
