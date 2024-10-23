// ignore_for_file: non_constant_identifier_full_names

part of 'type_of_ops_bloc.dart';

sealed class TypeOpsEvent extends Equatable {}

class LoadTypeOpsListEvent extends TypeOpsEvent {
  LoadTypeOpsListEvent({
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

class LoadNextTypeOpsListEvent extends TypeOpsEvent {
  LoadNextTypeOpsListEvent({
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

class CreateNewTypeOpsEvent extends TypeOpsEvent {
  CreateNewTypeOpsEvent({
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

class EditTypeOpsEvent extends TypeOpsEvent {
  EditTypeOpsEvent({
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

class DeleteTypeOpsEvent extends TypeOpsEvent {
  DeleteTypeOpsEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadTypeOpsDetailEvent extends TypeOpsEvent {
  final int id;

  LoadTypeOpsDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
