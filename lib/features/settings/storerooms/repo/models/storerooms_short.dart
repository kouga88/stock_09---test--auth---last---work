import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'storerooms_short.g.dart';

@JsonSerializable()
class StoreroomShort extends Equatable {
  final int id;
  final String? name;

  const StoreroomShort({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  String getName() {
    return '${name}';
  }

  // Фабричный конструктор для создания нового экземпляра Storeroomr из карты.
  factory StoreroomShort.fromJson(Map<String, dynamic> json) =>
      _$StoreroomShortFromJson(json);

  // Метод для преобразования экземпляра Storeroomr в карту.
  Map<String, dynamic> toJson() => _$StoreroomShortToJson(this);
}
