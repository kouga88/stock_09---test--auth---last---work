// ignore_for_file: non_constant_identifier_full_names

part of 'nomenclatueres_group_bloc.dart';

sealed class NomenclaturesGroupEvent extends Equatable {}

class LoadNomenclaturesGroupListEvent extends NomenclaturesGroupEvent {
  LoadNomenclaturesGroupListEvent({
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

class LoadNextNomenclaturesGroupListEvent extends NomenclaturesGroupEvent {
  LoadNextNomenclaturesGroupListEvent({
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

class CreateNewNomenclaturesGroupEvent extends NomenclaturesGroupEvent {
  CreateNewNomenclaturesGroupEvent({
    this.completer,
    required this.name,
    required this.description,
  });

  final Completer? completer;

  final String? name;

  final String? description;

  @override
  List<Object?> get props => [
        completer,
        name,
        description,
      ];
}

class EditNomenclaturesGroupEvent extends NomenclaturesGroupEvent {
  EditNomenclaturesGroupEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.description,
  });

  final int id;
  final String name;
  final String description;
  final Completer? completer;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        completer,
      ];
}

class DeleteNomenclaturesGroupEvent extends NomenclaturesGroupEvent {
  DeleteNomenclaturesGroupEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadNomenclaturesGroupDetailEvent extends NomenclaturesGroupEvent {
  final int id;

  LoadNomenclaturesGroupDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
