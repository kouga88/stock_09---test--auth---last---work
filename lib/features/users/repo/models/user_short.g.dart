// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_short.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserShort _$UserShortFromJson(Map<String, dynamic> json) => UserShort(
      id: (json['id'] as num).toInt(),
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      surname: json['surname'],
      is_superuser: json['is_superuser'],
    );

Map<String, dynamic> _$UserShortToJson(UserShort instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'surname': instance.surname,
      'is_superuser': instance.is_superuser,
    };
