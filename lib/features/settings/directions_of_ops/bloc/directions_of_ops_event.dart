// ignore_for_file: non_constant_identifier_full_names

part of 'directions_of_ops_bloc.dart';

sealed class DirectionsOpsEvent extends Equatable {}

class LoadDirectionsOpsListEvent extends DirectionsOpsEvent {
  LoadDirectionsOpsListEvent({
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

class LoadNextDirectionsOpsListEvent extends DirectionsOpsEvent {
  LoadNextDirectionsOpsListEvent({
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

class CreateNewDirectionsOpsEvent extends DirectionsOpsEvent {
  CreateNewDirectionsOpsEvent({
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

class EditDirectionsOpsEvent extends DirectionsOpsEvent {
  EditDirectionsOpsEvent({
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

class DeleteDirectionsOpsEvent extends DirectionsOpsEvent {
  DeleteDirectionsOpsEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadDirectionsOpsDetailEvent extends DirectionsOpsEvent {
  final int id;

  LoadDirectionsOpsDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
