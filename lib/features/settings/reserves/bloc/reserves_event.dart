// ignore_for_file: non_constant_identifier_names

part of 'reserves_bloc.dart';

sealed class ReservesEvent extends Equatable {}

class LoadReservesListEvent extends ReservesEvent {
  LoadReservesListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [completer, searchText];
}

class LoadNextReservesListEvent extends ReservesEvent {
  LoadNextReservesListEvent({
    this.completer,
    this.searchText,
  });

  final Completer? completer;
  final String? searchText;

  @override
  List<Object?> get props => [completer, searchText];
}

// ignore: must_be_immutable
class CreateNewReservesEvent extends ReservesEvent {
  CreateNewReservesEvent({
    this.completer,
    required this.name,
    required this.description,
    required this.storeroom,
    required this.status,
  });

  final String name;
  final Completer? completer;
  final String description;
  final StoreroomShort? storeroom;
  final bool? status;

  @override
  List<Object?> get props => [completer, description, name, storeroom];
}

class EditReservesEvent extends ReservesEvent {
  EditReservesEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.storeroom,
    required this.description,
    required this.status,
  });

  final int id;
  final String name;
  final Completer? completer;
  final String description;
  final StoreroomShort? storeroom;
  final bool? status;

  @override
  List<Object?> get props => [
        id,
        completer,
        description,
        name,
        storeroom,
        status,
      ];
}

class DeleteReservesEvent extends ReservesEvent {
  DeleteReservesEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadReservesDetailEvent extends ReservesEvent {
  final int id;

  LoadReservesDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
