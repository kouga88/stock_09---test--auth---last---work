abstract class IStoreroomApi {
  // получение списка пользоватетелей короткий (для выпадающих списков)
  Future<(bool, String, dynamic)> getStoreroomShort({required String token});

// получение списка пользоватетелей полный
  Future<(bool, String, dynamic)> getStoreroomList({
    required String token,
    required int page_size,
    required int page,
    String? searchText,
  });

// получение детальной информации о пользоватетеле
  Future<(bool, String, dynamic)> getStoreroomDetail(
      {required String token, required int id});

// редактирование пользоватетеля
  Future<(bool, String, dynamic)> editStoreroom({
    required String token,
    required int id,
    required String name,
    required String description,
    dynamic organization,
  });

// удаление пользоватетеля
  Future<(bool, String, dynamic)> deleteStoreroom({
    required String token,
    required int id,
  });
// создание нового пользоватетеля
  Future<(bool, String, dynamic)> createStoreroom({
    required String token,
    required dynamic name,
    required dynamic description,
    required String organization,
  });
}
