import 'package:json_annotation/json_annotation.dart';

part 'directions_of_ops_short.g.dart'; // Обратите внимание на правильное имя файла

@JsonSerializable()
class DirectionsOpsShort {
  final int id;
  final String? name;

  DirectionsOpsShort({
    required this.id,
    required this.name,
  });

  String getDirectionsOpsName() {
    return '$name';
  }

  factory DirectionsOpsShort.fromJson(Map<String, dynamic> json) =>
      _$DirectionsOpsShortFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionsOpsShortToJson(this);
}
