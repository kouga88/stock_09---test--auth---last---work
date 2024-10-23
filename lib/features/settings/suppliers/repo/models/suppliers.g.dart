// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suppliers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Suppliers _$SuppliersFromJson(Map<String, dynamic> json) => Suppliers(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SuppliersToJson(Suppliers instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
