part of 'group_bloc.dart';

sealed class GroupEvent extends Equatable {}

class LoadGroupListEvent extends GroupEvent {
  LoadGroupListEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class CreateNewGroupEvent extends GroupEvent {
  CreateNewGroupEvent({
    this.completer,
    required this.name,
  });

  final Completer? completer;
  final String name;

  @override
  List<Object?> get props => [completer, name];
}

class EditGroupEvent extends GroupEvent {
  EditGroupEvent({
    this.completer,
    // required this.id,
    required this.name,
  });

  // final int id;
  final Completer? completer;
  final String name;

  @override
  List<Object?> get props => [completer, name]; //id,
}

class DeleteGroupEvent extends GroupEvent {
  DeleteGroupEvent({
    this.completer,
    required this.name,
  });

  final String name;
  final Completer? completer;

  @override
  List<Object?> get props => [name];
}

class IncludeUserEvent extends GroupEvent {
  IncludeUserEvent({
    this.completer,
    required this.id,
    required this.userId,
  });

  final Completer? completer;
  final int id;
  final int userId;

  @override
  List<Object?> get props => [completer, id, userId];
}

class ExcludeUserEvent extends GroupEvent {
  ExcludeUserEvent({
    this.completer,
    required this.id,
    required this.userId,
  });

  final Completer? completer;
  final int id;
  final int userId;

  @override
  List<Object?> get props => [completer, id, userId];
}
