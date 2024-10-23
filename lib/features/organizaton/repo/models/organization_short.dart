import 'package:json_annotation/json_annotation.dart';

part 'organization_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class OrganizationShort {
  final int id;
  final String? name;

  OrganizationShort({
    required this.id,
    required this.name,
  });

  String getOrganizationsName() {
    return '$name';
  }

  factory OrganizationShort.fromJson(Map<String, dynamic> json) =>
      _$OrganizationShortFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationShortToJson(this);
}
