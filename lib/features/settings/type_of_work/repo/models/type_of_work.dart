import 'package:json_annotation/json_annotation.dart';

part 'type_of_work.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class TypeWork {
  final int id;
  final String? name;
  final String? description; // ?

  TypeWork({
    required this.id,
    required this.name,
    required this.description,
  });

  String getTypeWorkName() {
    return '$name';
  }

  factory TypeWork.fromJson(Map<String, dynamic> json) =>
      _$TypeWorkFromJson(json);

  Map<String, dynamic> toJson() => _$TypeWorkToJson(this);
}
