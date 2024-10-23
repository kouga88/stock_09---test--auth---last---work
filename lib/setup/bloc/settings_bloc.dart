import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pronet_storeroom_v_01/setup/repo/settings_repo.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this.settingsRepo) : super(const SettingsState()) {
    on<ToggleIsMenuOpenEvent>(_toggleIsMenuOpen);
  }

  final SettingsRepo settingsRepo;

  //
  Future<void> _toggleIsMenuOpen(
    ToggleIsMenuOpenEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(state.copyWith(isMenuOpen: !state.isMenuOpen));
    } catch (e, _) {
      emit(SettingsFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
