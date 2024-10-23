// ignore_for_file: non_constant_identifier_names

part of 'storerooms_bloc.dart';

sealed class StoreroomEvent extends Equatable {}

class LoadStoreroomListEvent extends StoreroomEvent {
  LoadStoreroomListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [completer, searchText];
}

class LoadNextStoreroomListEvent extends StoreroomEvent {
  LoadNextStoreroomListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [completer, searchText];
}

class CreateNewStoreroomEvent extends StoreroomEvent {
  CreateNewStoreroomEvent({
    this.completer,
    required this.name,
    required this.description,
    required this.organization,
  });

  final String name;
  final Completer? completer;
  final String description;
  final String? organization;

  @override
  List<Object?> get props => [completer, description, name, organization];
}

class EditStoreroomEvent extends StoreroomEvent {
  EditStoreroomEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.organization,
    required this.description,
  });

  final int id;
  final String name;
  final Completer? completer;
  final String description;
  final String? organization;

  // final bool is_active;

  @override
  List<Object?> get props => [
        id,
        completer,
        description,
        name,
        organization,
      ];
}

class DeleteStoreroomEvent extends StoreroomEvent {
  DeleteStoreroomEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class ChangeStoreroomPasswordEvent extends StoreroomEvent {
  ChangeStoreroomPasswordEvent({
    this.completer,
    required this.id,
    required this.password,
  });

  final Completer? completer;
  final int id;
  final String password;

  @override
  List<Object?> get props => [id];
}

class LoadStoreroomDetailEvent extends StoreroomEvent {
  final int id;

  LoadStoreroomDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
