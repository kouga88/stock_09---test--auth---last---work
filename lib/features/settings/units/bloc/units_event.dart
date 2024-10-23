// ignore_for_file: non_constant_identifier_full_names

part of 'units_bloc.dart';

sealed class UnitsEvent extends Equatable {}

class LoadUnitsListEvent extends UnitsEvent {
  LoadUnitsListEvent({
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

class LoadNextUnitsListEvent extends UnitsEvent {
  LoadNextUnitsListEvent({
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

class CreateNewUnitsEvent extends UnitsEvent {
  CreateNewUnitsEvent({
    this.completer,
    required this.full_name,
    required this.short_name,
    required this.description,
  });

  final Completer? completer;

  final String? full_name;
  final String? short_name;
  final String? description;

  @override
  List<Object?> get props => [
        completer,
        full_name,
        short_name,
        description,
      ];
}

class EditUnitsEvent extends UnitsEvent {
  EditUnitsEvent({
    this.completer,
    required this.id,
    required this.full_name,
    required this.short_name,
    required this.description,
  });

  final int id;
  final String full_name;
  final String short_name;
  final String description;
  final Completer? completer;

  @override
  List<Object?> get props => [
        id,
        full_name,
        short_name,
        description,
        completer,
      ];
}

class DeleteUnitsEvent extends UnitsEvent {
  DeleteUnitsEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadUnitsDetailEvent extends UnitsEvent {
  final int id;

  LoadUnitsDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
