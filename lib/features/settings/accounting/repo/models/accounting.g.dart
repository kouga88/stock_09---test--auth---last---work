// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accounting _$AccountingFromJson(Map<String, dynamic> json) => Accounting(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      number: json['number'] as String?,
    );

Map<String, dynamic> _$AccountingToJson(Accounting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
    };
