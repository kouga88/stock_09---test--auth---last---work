// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'units.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Units {
  final int id;
  final String? full_name;
  final String? short_name; // ?
  final String? description; // ?

  Units({
    required this.id,
    required this.full_name,
    required this.short_name,
    required this.description,
  });

  String getUnitName() {
    return '$full_name';
  }

  String getShortUnitName() {
    return '$short_name';
  }

  factory Units.fromJson(Map<String, dynamic> json) => _$UnitsFromJson(json);

  Map<String, dynamic> toJson() => _$UnitsToJson(this);
}
