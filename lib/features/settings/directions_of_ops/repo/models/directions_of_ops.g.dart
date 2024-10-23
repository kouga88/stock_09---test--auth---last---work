// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directions_of_ops.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectionsOps _$DirectionsOpsFromJson(Map<String, dynamic> json) =>
    DirectionsOps(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DirectionsOpsToJson(DirectionsOps instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
