// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'nomenclatueres_group_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class NomenclaturesGroupShort {
  final int id;
  final String name;

  NomenclaturesGroupShort({
    required this.id,
    required this.name,
  });

  String getName() {
    return name;
  }

  factory NomenclaturesGroupShort.fromJson(Map<String, dynamic> json) =>
      _$NomenclaturesGroupShortFromJson(json);

  Map<String, dynamic> toJson() => _$NomenclaturesGroupShortToJson(this);
}
