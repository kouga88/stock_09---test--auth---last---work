import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pronet_storeroom_v_01/features/auth/repo/auth_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepo) : super(AuthUnknownState()) {
    on<LogInEvent>(_logIn);
    on<LogOutEvent>(_logOut);
    on<IdentityEvent>(_identity);
  }

  final AuthRepo authRepo;

  Future<void> _logIn(
    LogInEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      if (state is! AuthSuccessedState) {
        emit(AuthLogining());
      }
      final (isError, errorMessage, user) = await authRepo.logIn(
          username: event.username, password: event.password);
      if (isError) {
        emit(AuthFailedState(message: errorMessage));
        return;
      }

      emit(AuthSuccessedState(user: user!));
    } catch (e, _) {
      emit(AuthErrorState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _logOut(
    LogOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await authRepo.logOut();
      emit(AuthNotUserState());
    } catch (e, _) {
      emit(AuthErrorState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _identity(
    IdentityEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final (User? user, String? reason) = await authRepo.getCurentUser();

      if (user != null) {
        emit(AuthSuccessedState(user: user));
        return;
      } else {
        if (reason != null && reason.length > 11) {
          emit(AuthNotUserState());
          return;
        } else {
          emit(AuthSuccessedErrorState(message: reason ?? ''));
          return;
        }
      }
    } catch (e, _) {
      emit(AuthSuccessedErrorState(message: e.toString()));
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
