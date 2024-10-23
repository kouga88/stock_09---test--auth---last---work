// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_short.g.dart';

@JsonSerializable()
class UserShort extends Equatable {
  final int id;
  final String? first_name;
  final String? last_name;
  final dynamic surname; // is_superuser
  final dynamic is_superuser; // is_superuser

  const UserShort({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.surname,
    required this.is_superuser,
  });

  @override
  List<Object?> get props => [
        id,
        first_name,
        last_name,
        surname,
      ];

  String getFullName() {
    return '$first_name $last_name';
  }

  // Фабричный конструктор для создания нового экземпляра Userr из карты.
  factory UserShort.fromJson(Map<String, dynamic> json) =>
      _$UserShortFromJson(json);

  // Метод для преобразования экземпляра Userr в карту.
  Map<String, dynamic> toJson() => _$UserShortToJson(this);
}
