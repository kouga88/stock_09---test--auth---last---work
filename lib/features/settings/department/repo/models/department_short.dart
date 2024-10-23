import 'package:json_annotation/json_annotation.dart';

part 'department_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class DepartmentShort {
  final int id;
  final String? name;

  DepartmentShort({
    required this.id,
    required this.name,
  });

  String getDepartmentName() {
    return '$name';
  }

  factory DepartmentShort.fromJson(Map<String, dynamic> json) =>
      _$DepartmentShortFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentShortToJson(this);
}
