import 'package:json_annotation/json_annotation.dart';

part 'mission_of_ops.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class MissionOperations {
  final int id;
  final String? name;
  final String? description; // ?

  MissionOperations({
    required this.id,
    required this.name,
    required this.description,
  });

  String getMissionOperationsName() {
    return '$name';
  }

  factory MissionOperations.fromJson(Map<String, dynamic> json) =>
      _$MissionOperationsFromJson(json);

  Map<String, dynamic> toJson() => _$MissionOperationsToJson(this);
}
