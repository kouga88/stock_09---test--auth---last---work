import 'package:json_annotation/json_annotation.dart';

part 'suppliers.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Suppliers {
  final int id;
  final String? name;
  final String? description; // ?

  Suppliers({
    required this.id,
    required this.name,
    required this.description,
  });

  String getSuppliersName() {
    return '$name';
  }

  factory Suppliers.fromJson(Map<String, dynamic> json) =>
      _$SuppliersFromJson(json);

  Map<String, dynamic> toJson() => _$SuppliersToJson(this);
}
