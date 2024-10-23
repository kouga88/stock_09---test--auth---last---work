// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentShort _$DepartmentShortFromJson(Map<String, dynamic> json) =>
    DepartmentShort(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DepartmentShortToJson(DepartmentShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
