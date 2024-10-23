// import 'package:json_annotation/json_annotation.dart';
// import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/group_nom/repo/models/group_nom_short.dart';
// import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storeroom_short.dart';
// import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';

// part 'nomenclatures.g.dart'; // Обратите внимание на правильное имя файла

// @JsonSerializable()
// class Nomenclatures {
//   final int id;
//   final String? name;
//   final String? description;
//   final UnitShort? unit;
//   final StoreroomShort? storeroom;
//   // final List<NomenclaturesParametrs>? parameters;
//   final List<NomenclaturesGroupShort>? groups;

//   Nomenclatures({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.unit,
//     required this.storeroom,
//     required this.groups,
//     // required this.parameters,
//   });

//   String getNomenclaturesName() {
//     return '$name';
//   }

//   factory Nomenclatures.fromJson(Map<String, dynamic> json) =>
//       _$NomenclaturesFromJson(json);

//   Map<String, dynamic> toJson() => _$NomenclaturesToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';

part 'nomenclatures.g.dart';

@JsonSerializable()
class Nomenclatures {
  final int id;
  final String? name;
  final String? description;
  final UnitShort? unit;
  final StoreroomShort? storeroom;
  final List<NomenclaturesParametrs>? parameters;

  final List<NomenclaturesGroupShort>? groups;

  Nomenclatures({
    required this.id,
    required this.name,
    required this.description,
    required this.unit,
    required this.storeroom,
    required this.parameters,
    required this.groups,
  });

  String getNomenclaturesName() {
    return '$name';
  }

  factory Nomenclatures.fromJson(Map<String, dynamic> json) => Nomenclatures(
        id: json['id'] as int,
        name: json['name'] as String?,
        description: json['description'] as String?,
        unit: json['unit'] == null
            ? null
            : UnitShort.fromJson(json['unit'] as Map<String, dynamic>),
        storeroom: json['storeroom'] == null
            ? null
            : StoreroomShort.fromJson(
                json['storeroom'] as Map<String, dynamic>),
        parameters: (json['parameters'] as List<dynamic>?)
                ?.map((e) =>
                    NomenclaturesParametrs.fromJson(e as Map<String, dynamic>))
                .toList() ??
            <NomenclaturesParametrs>[],
        groups: (json['groups'] as List<dynamic>?)
                ?.map((e) =>
                    NomenclaturesGroupShort.fromJson(e as Map<String, dynamic>))
                .toList() ??
            <NomenclaturesGroupShort>[], // Обработка пустого массива
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'unit': unit?.toJson(),
        'storeroom': storeroom?.toJson(),
        'groups': groups?.map((e) => e.toJson()).toList() ??
            [], // Обработка пустого массива
      };
}
