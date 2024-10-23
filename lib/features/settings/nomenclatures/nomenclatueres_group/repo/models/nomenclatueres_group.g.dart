// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nomenclatueres_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NomenclaturesGroup _$NomenclaturesGroupFromJson(Map<String, dynamic> json) =>
    NomenclaturesGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$NomenclaturesGroupToJson(NomenclaturesGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
