// ignore_for_file: non_constant_identifier_full_names

part of 'building_bloc.dart';

sealed class BuildingEvent extends Equatable {}

class LoadBuildingListEvent extends BuildingEvent {
  LoadBuildingListEvent({
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

class LoadNextBuildingListEvent extends BuildingEvent {
  LoadNextBuildingListEvent({
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

class CreateNewBuildingEvent extends BuildingEvent {
  CreateNewBuildingEvent({
    this.completer,
    required this.name,
    required this.description,
    required this.status,
  });

  final Completer? completer;

  final String? name;
  final String? description;
  final bool? status;

  @override
  List<Object?> get props => [completer, name, description, status];
}

class EditBuildingEvent extends BuildingEvent {
  EditBuildingEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  final int id;
  final String name;
  final String description;
  final bool status;
  final Completer? completer;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        status,
        completer,
      ];
}

class DeleteBuildingEvent extends BuildingEvent {
  DeleteBuildingEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadBuildingDetailEvent extends BuildingEvent {
  final int id;

  LoadBuildingDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
