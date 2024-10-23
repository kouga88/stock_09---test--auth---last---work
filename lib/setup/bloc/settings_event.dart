part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {}

class ToggleIsMenuOpenEvent extends SettingsEvent {

  ToggleIsMenuOpenEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];

}