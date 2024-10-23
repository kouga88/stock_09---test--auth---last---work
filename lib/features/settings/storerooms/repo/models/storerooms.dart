import 'package:json_annotation/json_annotation.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';

part 'storerooms.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Storeroom {
  final int id;
  final String name;
  final Organization organization;
  final String? description;

  Storeroom({
    required this.id,
    required this.name,
    required this.organization,
    required this.description,
  });

  // Метод для получения полного имени
  String getName() {
    return name;
  }

  // Метод для десериализации из JSON
  factory Storeroom.fromJson(Map<String, dynamic> json) =>
      _$StoreroomFromJson(json);

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() => _$StoreroomToJson(this);
}
