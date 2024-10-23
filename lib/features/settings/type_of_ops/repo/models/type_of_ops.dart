import 'package:json_annotation/json_annotation.dart';

part 'type_of_ops.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class TypeOps {
  final int id;
  final String? name;
  final String? description; // ?

  TypeOps({
    required this.id,
    required this.name,
    required this.description,
  });

  String getTypeOpsName() {
    return '$name';
  }

  factory TypeOps.fromJson(Map<String, dynamic> json) =>
      _$TypeOpsFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOpsToJson(this);
}
