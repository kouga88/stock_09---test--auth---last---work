// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_of_ops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MissionOperations _$MissionOperationsFromJson(Map<String, dynamic> json) =>
    MissionOperations(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MissionOperationsToJson(MissionOperations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
