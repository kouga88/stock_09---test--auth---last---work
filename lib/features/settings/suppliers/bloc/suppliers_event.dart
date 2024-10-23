// ignore_for_file: non_constant_identifier_full_names

part of 'suppliers_bloc.dart';

sealed class SuppliersEvent extends Equatable {}

class LoadSuppliersListEvent extends SuppliersEvent {
  LoadSuppliersListEvent({
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

class LoadNextSuppliersListEvent extends SuppliersEvent {
  LoadNextSuppliersListEvent({
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

class CreateNewSuppliersEvent extends SuppliersEvent {
  CreateNewSuppliersEvent({
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

class EditSuppliersEvent extends SuppliersEvent {
  EditSuppliersEvent({
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

class DeleteSuppliersEvent extends SuppliersEvent {
  DeleteSuppliersEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadSuppliersDetailEvent extends SuppliersEvent {
  final int id;

  LoadSuppliersDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
