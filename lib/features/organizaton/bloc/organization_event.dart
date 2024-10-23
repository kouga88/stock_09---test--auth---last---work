// ignore_for_file: non_constant_identifier_names

part of 'organization_bloc.dart';

sealed class OrganizationEvent extends Equatable {}

class LoadOrganizationListEvent extends OrganizationEvent {
  LoadOrganizationListEvent({
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

class LoadNextOrganizationListEvent extends OrganizationEvent {
  LoadNextOrganizationListEvent({
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

class CreateNewOrganizationEvent extends OrganizationEvent {
  CreateNewOrganizationEvent({
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

class EditOrganizationEvent extends OrganizationEvent {
  EditOrganizationEvent({
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

class DeleteOrganizationEvent extends OrganizationEvent {
  DeleteOrganizationEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadOrganizationDetailEvent extends OrganizationEvent {
  final int id;

  LoadOrganizationDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
