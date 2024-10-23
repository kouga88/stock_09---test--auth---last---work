// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserves_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservesShort _$ReservesShortFromJson(Map<String, dynamic> json) =>
    ReservesShort(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ReservesShortToJson(ReservesShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
