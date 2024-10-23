part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool isMenuOpen;

  const SettingsState({this.isMenuOpen = true});

  SettingsState copyWith({
                    bool? isMenuOpen, 
                  }) {
    return SettingsState(
      isMenuOpen: isMenuOpen??this.isMenuOpen,
    );  
  }

  @override
  List<Object?> get props => [isMenuOpen];

}

class SettingsFailureState extends SettingsState {
  const SettingsFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
