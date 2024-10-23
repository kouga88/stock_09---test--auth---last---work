// ignore_for_file: non_constant_identifier_full_names

part of 'type_of_work_bloc.dart';

sealed class TypeWorkEvent extends Equatable {}

class LoadTypeWorkListEvent extends TypeWorkEvent {
  LoadTypeWorkListEvent({
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

class LoadNextTypeWorkListEvent extends TypeWorkEvent {
  LoadNextTypeWorkListEvent({
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

class CreateNewTypeWorkEvent extends TypeWorkEvent {
  CreateNewTypeWorkEvent({
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

class EditTypeWorkEvent extends TypeWorkEvent {
  EditTypeWorkEvent({
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

class DeleteTypeWorkEvent extends TypeWorkEvent {
  DeleteTypeWorkEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadTypeWorkDetailEvent extends TypeWorkEvent {
  final int id;

  LoadTypeWorkDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
