// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nomenclatures_parametrs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NomenclaturesParametrs _$NomenclaturesParametrsFromJson(
        Map<String, dynamic> json) =>
    NomenclaturesParametrs(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      unit: json['unit'] == null
          ? null
          : UnitShort.fromJson(json['unit'] as Map<String, dynamic>),
      description: json['description'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$NomenclaturesParametrsToJson(
        NomenclaturesParametrs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'description': instance.description,
      'value': instance.value,
    };
