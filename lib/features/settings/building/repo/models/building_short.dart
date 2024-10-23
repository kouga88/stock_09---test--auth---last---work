import 'package:json_annotation/json_annotation.dart';

part 'building_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class BuildingShort {
  final int id;
  final String? name;

  BuildingShort({
    required this.id,
    required this.name,
  });

  String getBuildingName() {
    return '$name';
  }

  factory BuildingShort.fromJson(Map<String, dynamic> json) =>
      _$BuildingShortFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingShortToJson(this);
}
