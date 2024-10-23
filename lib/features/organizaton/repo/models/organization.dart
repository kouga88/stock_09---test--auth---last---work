import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class Organization {
  final int id;
  final String? name; // ?
  final String? description; // ?

  Organization({
    required this.id,
    required this.name,
    required this.description,
  });

  String getOrganizationsName() {
    return '$name';
  }

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
