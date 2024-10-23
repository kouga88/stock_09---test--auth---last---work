import 'package:json_annotation/json_annotation.dart';

part 'type_of_ops_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class TypeOpsShort {
  final int id;
  final String? name;

  TypeOpsShort({
    required this.id,
    required this.name,
  });

  String getTypeOpsName() {
    return '$name';
  }

  factory TypeOpsShort.fromJson(Map<String, dynamic> json) =>
      _$TypeOpsShortFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOpsShortToJson(this);
}
