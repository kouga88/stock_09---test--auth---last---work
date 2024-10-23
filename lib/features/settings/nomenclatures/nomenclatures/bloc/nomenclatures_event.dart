// ignore_for_file: non_constant_identifier_full_names

part of 'nomenclatures_bloc.dart';

sealed class NomenclaturesEvent extends Equatable {}

class LoadNomenclaturesListEvent extends NomenclaturesEvent {
  LoadNomenclaturesListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [
        completer,
        searchText,
      ];
}

class LoadNextNomenclaturesListEvent extends NomenclaturesEvent {
  LoadNextNomenclaturesListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [
        completer,
        searchText,
      ];
}

class CreateNewNomenclaturesEvent extends NomenclaturesEvent {
  CreateNewNomenclaturesEvent({
    this.completer,
    required this.name,
    required this.unit,
    required this.storeroom,
    required this.groups,
    required this.description,
  });

  final Completer? completer;

  final String? name;
  final UnitShort? unit;
  final StoreroomShort? storeroom;
  final String? description;
  final List<NomenclaturesGroupShort> groups;

  @override
  List<Object?> get props => [
        completer,
        name,
        description,
      ];
}

class EditNomenclaturesEvent extends NomenclaturesEvent {
  EditNomenclaturesEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.unit,
    required this.storeroom,
    required this.description,
    required this.groups,
  });

  final int id;
  final String name;
  final UnitShort? unit;
  final StoreroomShort? storeroom;
  final String description;
  final List<NomenclaturesGroupShort> groups;
  final Completer? completer;

  @override
  List<Object?> get props => [
        id,
        name,
        unit,
        storeroom,
        description,
        completer,
      ];
}

class DeleteNomenclaturesEvent extends NomenclaturesEvent {
  DeleteNomenclaturesEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadNomenclaturesDetailEvent extends NomenclaturesEvent {
  final int id;

  LoadNomenclaturesDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
