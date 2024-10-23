import 'package:json_annotation/json_annotation.dart';

part 'accounting_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class AccountingShort {
  final int id;
  final String? number;

  AccountingShort({
    required this.id,
    required this.number,
  });

  String getAccountingNumber() {
    return '$number';
  }

  factory AccountingShort.fromJson(Map<String, dynamic> json) =>
      _$AccountingShortFromJson(json);

  Map<String, dynamic> toJson() => _$AccountingShortToJson(this);
}
