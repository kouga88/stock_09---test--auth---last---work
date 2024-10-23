import 'package:json_annotation/json_annotation.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';

part 'nomenclatures_parametrs.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class NomenclaturesParametrs {
  final int id;
  final String name;
  final UnitShort? unit;
  final String? description;
  final String? value;

  NomenclaturesParametrs({
    required this.id,
    required this.name,
    required this.unit,
    required this.description,
    required this.value,
  });

  // Метод для получения полного имени
  String getName() {
    return name;
  }

  // Метод для десериализации из JSON
  factory NomenclaturesParametrs.fromJson(Map<String, dynamic> json) =>
      _$NomenclaturesParametrsFromJson(json);

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() => _$NomenclaturesParametrsToJson(this);
}
