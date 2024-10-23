// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'units_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class UnitShort {
  final int? id;
  final String? short_name;
  final String? name;

  UnitShort({
    required this.id,
    required this.short_name,
    required this.name,
  });

  String getShortUnitName() {
    return '$short_name';
  }

  factory UnitShort.fromJson(Map<String, dynamic> json) =>
      _$UnitShortFromJson(json);

  Map<String, dynamic> toJson() => _$UnitShortToJson(this);

  map(String Function(dynamic unit) param0) {}
}
