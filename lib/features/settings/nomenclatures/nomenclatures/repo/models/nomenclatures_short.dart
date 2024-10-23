// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'nomenclatures_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class NomenclaturesShort {
  final int id;
  final String short_name;

  NomenclaturesShort({
    required this.id,
    required this.short_name,
  });

  String getName() {
    return short_name;
  }

  factory NomenclaturesShort.fromJson(Map<String, dynamic> json) =>
      _$NomenclaturesShortFromJson(json);

  Map<String, dynamic> toJson() => _$NomenclaturesShortToJson(this);
}
