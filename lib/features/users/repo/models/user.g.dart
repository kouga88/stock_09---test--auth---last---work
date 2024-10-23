// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      organization:
          Organization.fromJson(json['organization'] as Map<String, dynamic>),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      is_superuser: json['is_superuser'] as bool,
      username: json['username'] as String,
      password: json['password'],
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      is_staff: json['is_staff'] as bool,
      is_active: json['is_active'] as bool,
      email: json['email'],
      surname: json['surname'],
      telegram_id: json['telegram_id'],
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'surname': instance.surname,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'is_superuser': instance.is_superuser,
      'is_staff': instance.is_staff,
      'is_active': instance.is_active,
      'telegram_id': instance.telegram_id,
      'organization': instance.organization,
      'department': instance.department,
      'groups': instance.groups,
    };
