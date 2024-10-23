// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_of_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeWork _$TypeWorkFromJson(Map<String, dynamic> json) => TypeWork(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TypeWorkToJson(TypeWork instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
