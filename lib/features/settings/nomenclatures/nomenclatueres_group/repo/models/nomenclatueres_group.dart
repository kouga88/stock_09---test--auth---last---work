import 'package:json_annotation/json_annotation.dart';

part 'nomenclatueres_group.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class NomenclaturesGroup {
  final int id;
  final String? name;

  final String? description; // ?

  NomenclaturesGroup({
    required this.id,
    required this.name,
    required this.description,
  });

  String getNomenclaturesGroupName() {
    return '$name';
  }

  factory NomenclaturesGroup.fromJson(Map<String, dynamic> json) =>
      _$NomenclaturesGroupFromJson(json);

  Map<String, dynamic> toJson() => _$NomenclaturesGroupToJson(this);
}
