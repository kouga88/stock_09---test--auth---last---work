part of 'form_return_bloc.dart';

sealed class FormReturnEvent extends Equatable {}

class FormReturnLoadDictionariesEvent extends FormReturnEvent {
  FormReturnLoadDictionariesEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class FormReturnSaveEvent extends FormReturnEvent {
  final String jsonString;

  FormReturnSaveEvent({
    this.completer,
    required this.jsonString,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [jsonString, completer];
}
