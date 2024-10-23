import 'package:json_annotation/json_annotation.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';

part 'reserves.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Reserves {
  final int id;
  final String name;
  final StoreroomShort? storeroom;
  final String? description;
  final bool? status;

  Reserves({
    required this.id,
    required this.name,
    required this.storeroom,
    required this.status,
    required this.description,
  });

  // Метод для получения полного имени
  String getName() {
    return name;
  }

  // Метод для десериализации из JSON
  factory Reserves.fromJson(Map<String, dynamic> json) =>
      _$ReservesFromJson(json);

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() => _$ReservesToJson(this);
}
