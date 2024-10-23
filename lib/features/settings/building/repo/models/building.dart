import 'package:json_annotation/json_annotation.dart';

part 'building.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Building {
  final int id;
  final String? name;
  final String? description; // ?
  final bool? status; // ?

  Building({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  String getBuildingName() {
    return '$name';
  }

  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingToJson(this);
}
