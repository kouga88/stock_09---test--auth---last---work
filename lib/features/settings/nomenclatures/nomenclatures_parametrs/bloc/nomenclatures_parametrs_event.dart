// ignore_for_file: non_constant_identifier_names

part of 'nomenclatures_parametrs_bloc.dart';

sealed class NomenclaturesParametrsEvent extends Equatable {}

class LoadNomenclaturesParametrsListEvent extends NomenclaturesParametrsEvent {
  LoadNomenclaturesParametrsListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [completer, searchText];
}

class LoadNextNomenclaturesParametrsListEvent
    extends NomenclaturesParametrsEvent {
  LoadNextNomenclaturesParametrsListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [completer, searchText];
}

// ignore: must_be_immutable
class CreateNewNomenclaturesParametrsEvent extends NomenclaturesParametrsEvent {
  CreateNewNomenclaturesParametrsEvent({
    this.completer,
    required this.name,
    required this.unit,
    required this.description,
  });

  final String name;
  final Completer? completer;
  final UnitShort? unit;
  final String description;

  @override
  List<Object?> get props => [
        completer,
        name,
        unit,
        description,
      ];
}

class EditNomenclaturesParametrsEvent extends NomenclaturesParametrsEvent {
  EditNomenclaturesParametrsEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.unit,
    required this.description,
  });

  final int id;
  final String name;
  final Completer? completer;
  final UnitShort? unit;
  final String description;

  @override
  List<Object?> get props => [
        id,
        completer,
        name,
        unit,
        description,
      ];
}

class DeleteNomenclaturesParametrsEvent extends NomenclaturesParametrsEvent {
  DeleteNomenclaturesParametrsEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadNomenclaturesParametrsDetailEvent
    extends NomenclaturesParametrsEvent {
  final int id;

  LoadNomenclaturesParametrsDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
