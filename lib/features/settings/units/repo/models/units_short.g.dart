// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitShort _$UnitShortFromJson(Map<String, dynamic> json) => UnitShort(
      id: (json['id'] as num?)?.toInt(),
      short_name: json['short_name'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UnitShortToJson(UnitShort instance) => <String, dynamic>{
      'id': instance.id,
      'short_name': instance.short_name,
      'name': instance.name,
    };
