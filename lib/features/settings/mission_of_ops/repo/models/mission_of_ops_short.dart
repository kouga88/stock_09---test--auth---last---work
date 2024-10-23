import 'package:json_annotation/json_annotation.dart';

part 'mission_of_ops_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class MissionOperationsShort {
  final int id;
  final String? name;

  MissionOperationsShort({
    required this.id,
    required this.name,
  });

  String getMissionOperationsName() {
    return '$name';
  }

  factory MissionOperationsShort.fromJson(Map<String, dynamic> json) =>
      _$MissionOperationsShortFromJson(json);

  Map<String, dynamic> toJson() => _$MissionOperationsShortToJson(this);
}
