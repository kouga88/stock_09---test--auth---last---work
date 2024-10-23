// ignore_for_file: non_constant_identifier_names

part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {}

class LoadUserListEvent extends UserEvent {
  LoadUserListEvent({
    this.completer,
    this.searchText,
    this.filterIsStaff,
    this.filterIsActive,
    this.filterIsSuperUser,
  });

  final Completer? completer;
  final String? searchText;
  final bool? filterIsStaff;
  final bool? filterIsActive;
  final bool? filterIsSuperUser;

  @override
  List<Object?> get props =>
      [completer, searchText, filterIsStaff, filterIsActive, filterIsSuperUser];
}

class LoadNextUserListEvent extends UserEvent {
  LoadNextUserListEvent({
    this.completer,
    this.searchText,
    this.filterIsStaff,
    this.filterIsActive,
    this.filterIsSuperUser,
  });

  final Completer? completer;
  final String? searchText;
  final bool? filterIsStaff;
  final bool? filterIsActive;
  final bool? filterIsSuperUser;

  @override
  List<Object?> get props =>
      [completer, searchText, filterIsStaff, filterIsActive, filterIsSuperUser];
}

class CreateNewUserEvent extends UserEvent {
  CreateNewUserEvent({
    this.completer,
    required this.last_name,
    required this.first_name,
    required this.is_staff,
    // required this.is_active,
    required this.is_superuser,
    required this.organization,
    required this.department,
    required this.groups,
    required this.username,
    required this.password,
    required this.email,
    required this.surname,
    required this.telegram_id,
  });

  final Completer? completer;
  final String first_name;
  final String last_name;
  final bool is_staff;
  final bool is_superuser;
  // final bool is_active;
  final String? organization;
  final String? department;
  final dynamic surname;
  final dynamic password;
  final dynamic email;
  final dynamic telegram_id;

  final List<Group> groups;
  final String? username;

  @override
  List<Object?> get props => [
        completer,
        first_name,
        last_name,
        is_staff,
        is_superuser,
        // is_active,
        telegram_id,
        organization,
        department,
        surname,
        username,
        password,
        email,
      ];
}

class EditUserEvent extends UserEvent {
  EditUserEvent({
    this.completer,
    required this.id,
    required this.last_name,
    required this.first_name,
    required this.email,
    required this.is_staff,
    // required this.is_active,
    required this.is_superuser,
    required this.organization,
    required this.department,
    required this.telegram_id,
    required this.groups,
    required this.username,
    required this.surname,
  });

  final int id;
  final Completer? completer;
  final String first_name;
  final String last_name;
  final dynamic surname;
  final dynamic email;
  final dynamic telegram_id;
  final bool is_staff;
  final bool is_superuser;
  // final bool is_active;
  final String? organization;
  final String? department;
  final String username;

  final List<Group> groups;

  @override
  List<Object?> get props => [
        id,
        completer,
        first_name,
        last_name,
        surname,
        username,
        organization,
        department,
        email,
        is_staff,
        is_superuser,
        // is_active,
        telegram_id
      ];
}

class DeleteUserEvent extends UserEvent {
  DeleteUserEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class ChangeUserPasswordEvent extends UserEvent {
  ChangeUserPasswordEvent({
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

class LoadUserDetailEvent extends UserEvent {
  final int id;

  LoadUserDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
