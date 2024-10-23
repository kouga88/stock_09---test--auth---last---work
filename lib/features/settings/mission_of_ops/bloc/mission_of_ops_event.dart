// ignore_for_file: non_constant_identifier_full_names

part of 'mission_of_ops_bloc.dart';

sealed class MissionOperationsEvent extends Equatable {}

class LoadMissionOperationsListEvent extends MissionOperationsEvent {
  LoadMissionOperationsListEvent({
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

class LoadNextMissionOperationsListEvent extends MissionOperationsEvent {
  LoadNextMissionOperationsListEvent({
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

class CreateNewMissionOperationsEvent extends MissionOperationsEvent {
  CreateNewMissionOperationsEvent({
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

class EditMissionOperationsEvent extends MissionOperationsEvent {
  EditMissionOperationsEvent({
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

class DeleteMissionOperationsEvent extends MissionOperationsEvent {
  DeleteMissionOperationsEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadMissionOperationsDetailEvent extends MissionOperationsEvent {
  final int id;

  LoadMissionOperationsDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
