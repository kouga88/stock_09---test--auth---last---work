import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reserves_short.g.dart';

@JsonSerializable()
class ReservesShort extends Equatable {
  final int id;
  final String? name;

  const ReservesShort({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  String getName() {
    return '$name';
  }

  // Фабричный конструктор для создания нового экземпляра Reservesr из карты.
  factory ReservesShort.fromJson(Map<String, dynamic> json) =>
      _$ReservesShortFromJson(json);

  // Метод для преобразования экземпляра Reservesr в карту.
  Map<String, dynamic> toJson() => _$ReservesShortToJson(this);
}
