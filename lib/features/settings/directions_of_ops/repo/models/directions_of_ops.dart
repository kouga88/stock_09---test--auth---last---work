import 'package:json_annotation/json_annotation.dart';

part 'directions_of_ops.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class DirectionsOps {
  final int id;
  final String? name;
  final String? description; // ?

  DirectionsOps({
    required this.id,
    required this.name,
    required this.description,
  });

  String getDirectionsOpsName() {
    return '$name';
  }

  factory DirectionsOps.fromJson(Map<String, dynamic> json) =>
      _$DirectionsOpsFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionsOpsToJson(this);
}
