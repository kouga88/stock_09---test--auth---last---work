// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storerooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Storeroom _$StoreroomFromJson(Map<String, dynamic> json) => Storeroom(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      organization:
          Organization.fromJson(json['organization'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$StoreroomToJson(Storeroom instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organization': instance.organization,
      'description': instance.description,
    };
