import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'nomenclatures_parametrs_short.g.dart';

@JsonSerializable()
class NomenclaturesParametrsShort extends Equatable {
  final int id;
  final String name;

  const NomenclaturesParametrsShort({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  String getName() {
    return name;
  }

  // Фабричный конструктор для создания нового экземпляра NomenclaturesParametrsr из карты.
  factory NomenclaturesParametrsShort.fromJson(Map<String, dynamic> json) =>
      _$NomenclaturesParametrsShortFromJson(json);

  // Метод для преобразования экземпляра NomenclaturesParametrsr в карту.
  Map<String, dynamic> toJson() => _$NomenclaturesParametrsShortToJson(this);
}
