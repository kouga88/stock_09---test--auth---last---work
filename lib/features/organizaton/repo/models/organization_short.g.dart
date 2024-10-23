// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationShort _$OrganizationShortFromJson(Map<String, dynamic> json) =>
    OrganizationShort(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OrganizationShortToJson(OrganizationShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
