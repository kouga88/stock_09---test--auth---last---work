import 'package:json_annotation/json_annotation.dart';

part 'type_of_work_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class TypeWorkShort {
  final int id;
  final String? name;

  TypeWorkShort({
    required this.id,
    required this.name,
  });

  String getTypeWorkName() {
    return '$name';
  }

  factory TypeWorkShort.fromJson(Map<String, dynamic> json) =>
      _$TypeWorkShortFromJson(json);

  Map<String, dynamic> toJson() => _$TypeWorkShortToJson(this);
}
