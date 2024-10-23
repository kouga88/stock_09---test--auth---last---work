// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Units _$UnitsFromJson(Map<String, dynamic> json) => Units(
      id: (json['id'] as num).toInt(),
      full_name: json['full_name'] as String?,
      short_name: json['short_name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UnitsToJson(Units instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.full_name,
      'short_name': instance.short_name,
      'description': instance.description,
    };
