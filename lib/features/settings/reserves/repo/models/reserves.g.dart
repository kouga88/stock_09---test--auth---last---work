// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserves.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reserves _$ReservesFromJson(Map<String, dynamic> json) => Reserves(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      storeroom: json['storeroom'] == null
          ? null
          : StoreroomShort.fromJson(json['storeroom'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ReservesToJson(Reserves instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'storeroom': instance.storeroom,
      'description': instance.description,
      'status': instance.status,
    };
