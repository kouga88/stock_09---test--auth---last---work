// ignore_for_file: non_constant_identifier_names

part of 'accounting_bloc.dart';

sealed class AccountingEvent extends Equatable {}

class LoadAccountingListEvent extends AccountingEvent {
  LoadAccountingListEvent({
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

class LoadNextAccountingListEvent extends AccountingEvent {
  LoadNextAccountingListEvent({
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

class CreateNewAccountingEvent extends AccountingEvent {
  CreateNewAccountingEvent({
    this.completer,
    required this.name,
    required this.number,
  });

  final Completer? completer;

  final String? name;
  final String? number;

  @override
  List<Object?> get props => [
        completer,
        name,
        number,
      ];
}

class EditAccountingEvent extends AccountingEvent {
  EditAccountingEvent({
    this.completer,
    required this.id,
    required this.name,
    required this.number,
  });

  final int id;
  final String name;
  final String number;

  final Completer? completer;

  @override
  List<Object?> get props => [
        id,
        name,
        number,
        completer,
      ];
}

class DeleteAccountingEvent extends AccountingEvent {
  DeleteAccountingEvent({
    this.completer,
    required this.id,
  });

  final int id;
  final Completer? completer;

  @override
  List<Object?> get props => [id];
}

class LoadAccountingDetailEvent extends AccountingEvent {
  final int id;

  LoadAccountingDetailEvent({
    this.completer,
    required this.id,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [id, completer];
}
