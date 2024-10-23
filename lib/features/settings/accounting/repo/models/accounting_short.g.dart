// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounting_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountingShort _$AccountingShortFromJson(Map<String, dynamic> json) =>
    AccountingShort(
      id: (json['id'] as num).toInt(),
      number: json['number'] as String?,
    );

Map<String, dynamic> _$AccountingShortToJson(AccountingShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
    };
