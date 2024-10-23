import 'package:json_annotation/json_annotation.dart';

part 'department.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Department {
  final int id;
  final String? name;
  final String? description; // ?

  Department({
    required this.id,
    required this.name,
    required this.description,
  });

  String getDepartmentName() {
    return '$name';
  }

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}
