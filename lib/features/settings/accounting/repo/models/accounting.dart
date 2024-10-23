import 'package:json_annotation/json_annotation.dart';

part 'accounting.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Accounting {
  final int id;
  final String? name;
  final String? number; // ?

  Accounting({
    required this.id,
    required this.name,
    required this.number,
  });

  String getAccountingName() {
    return '$name';
  }

  String getAccountingNumber() {
    return '$number';
  }

  factory Accounting.fromJson(Map<String, dynamic> json) =>
      _$AccountingFromJson(json);

  Map<String, dynamic> toJson() => _$AccountingToJson(this);
}
