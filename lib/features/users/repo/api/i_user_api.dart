// ignore_for_file: non_constant_identifier_names, duplicate_ignore

abstract class IUserApi {
  // получение списка пользоватетелей короткий (для выпадающих списков)
  Future<(bool, String, dynamic)> getUserShort({required String token});

// получение списка пользоватетелей полный
  Future<(bool, String, dynamic)> getUserList({
    required String token,
    required int page_size,
    required int page,
    String? searchText,
    bool? is_staff,
    bool? is_active,
    bool? is_superuser,
  });

// поиск полный
  Future<(bool, String, dynamic)> searchUser({
    required String token,
    required int page_size,
    required int page,
    required dynamic params,
  });

// получение детальной информации о пользоватетеле
  Future<(bool, String, dynamic)> getUserDetail(
      {required String token, required int id});

// редактирование пользоватетеля
  Future<(bool, String, dynamic)> editUser({
    required String token,
    required int id,
    required String first_name,
    required String last_name,
    required String username,
    dynamic email,
    bool? is_staff,
    // bool? is_active,
    bool? is_superuser,
    int? telegram_id,
    dynamic organization,
    dynamic department,
    dynamic surname,
    List? groups,
  });

// удаление пользоватетеля
  Future<(bool, String, dynamic)> deleteUser({
    required String token,
    required int id,
  });
// создание нового пользоватетеля
  Future<(bool, String, dynamic)> createUser({
    required String token,
    required dynamic first_name,
    required dynamic last_name,
    required dynamic username,
    required String password,
    required String department,
    required dynamic email,
    required dynamic telegram_id,
    required bool is_superuser,
    required bool is_staff,
    // required bool is_active,
    required List<String> groups,
    required String organization,
    required dynamic surname,
  });
// смена пароля пользоватетеля
  Future<(bool, String, dynamic)> changeUserPassword(
      {required String token, required int id, required String password});

// получение групп пользоватетелей
  Future<(bool, String, dynamic)> getGroupsShort({required String token});

// получение групп пользоватетелей
  Future<(bool, String, dynamic)> getGroupDetail(
      {required String token, required int id});

// создание групп пользоватетелей
  Future<(bool, String, dynamic)> createNewGroup(
      {required String token, required String name});

// редактирование групп пользоватетелей
  Future<(bool, String, dynamic)> editGroup(
      {required String token, required int id, required String name});

// удаление групп пользоватетелей
  Future<(bool, String, dynamic)> deleteGroup(
      {required String token, required int id});
}
