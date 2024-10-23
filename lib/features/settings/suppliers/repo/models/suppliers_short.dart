import 'package:json_annotation/json_annotation.dart';

part 'suppliers_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class SuppliersShort {
  final int id;
  final String? name;

  SuppliersShort({
    required this.id,
    required this.name,
  });

  String getSuppliersName() {
    return '$name';
  }

  factory SuppliersShort.fromJson(Map<String, dynamic> json) =>
      _$SuppliersShortFromJson(json);

  Map<String, dynamic> toJson() => _$SuppliersShortToJson(this);
}
