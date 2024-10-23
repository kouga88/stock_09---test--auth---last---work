import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';

abstract class IReservesApi {
  // получение списка резервeй короткий (для выпадающих списков)
  Future<(bool, String, dynamic)> getReservesShort({required String token});

// получение списка резервeй полный
  Future<(bool, String, dynamic)> getReservesList({
    required String token,
    required int page_size,
    required int page,
    String? searchText,
  });

// получение детальной информации о резервe
  Future<(bool, String, dynamic)> getReservesDetail(
      {required String token, required int id});

// редактирование резерва
  Future<(bool, String, dynamic)> editReserves({
    required String token,
    required int id,
    required String name,
    required String description,
    required StoreroomShort? storeroom,
    required bool? status,
  });

// удаление резерва
  Future<(bool, String, dynamic)> deleteReserves({
    required String token,
    required int id,
  });

// создание нового резерва
  Future<(bool, String, dynamic)> createReserves({
    required String token,
    required dynamic name,
    required dynamic description,
    required StoreroomShort? storeroom,
    required bool? status,
  });
}
