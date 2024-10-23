// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
import 'group.dart';

part 'user.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class User {
  final int id;
  final String first_name;
  final String last_name;
  final dynamic surname;
  final String username;
  final dynamic email;
  final dynamic password;
  final bool is_superuser;
  final bool is_staff;
  final bool is_active;
  final dynamic telegram_id;
  final Organization organization;
  final Department department;
  final List<Group> groups;

  User({
    required this.id,
    required this.organization,
    required this.department,
    required this.is_superuser,
    required this.username,
    required this.password,
    required this.first_name,
    required this.last_name,
    required this.is_staff,
    required this.is_active,
    required this.email,
    required this.surname,
    required this.telegram_id,
    required this.groups,
  });

  // Метод для получения полного имени
  String getFullName() {
    return '$first_name $last_name${surname != null ? ' $surname' : ''}';
  }

  // Метод для десериализации из JSON
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Метод для сериализации в JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
