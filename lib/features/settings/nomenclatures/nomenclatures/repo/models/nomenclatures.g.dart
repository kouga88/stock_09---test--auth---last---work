// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nomenclatures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nomenclatures _$NomenclaturesFromJson(Map<String, dynamic> json) =>
    Nomenclatures(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      unit: json['unit'] == null
          ? null
          : UnitShort.fromJson(json['unit'] as Map<String, dynamic>),
      storeroom: json['storeroom'] == null
          ? null
          : StoreroomShort.fromJson(json['storeroom'] as Map<String, dynamic>),
      parameters: (json['parameters'] as List<dynamic>?)
          ?.map(
              (e) => NomenclaturesParametrs.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) =>
              NomenclaturesGroupShort.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NomenclaturesToJson(Nomenclatures instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'unit': instance.unit,
      'storeroom': instance.storeroom,
      'parameters': instance.parameters,
      'groups': instance.groups,
    };
