part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {}

class LogInEvent extends AuthEvent {
  LogInEvent({required this.username, required this.password, this.completer});

  final String username;
  final String password;
  final Completer? completer;

  @override
  List<Object?> get props => [username, password, completer];
}

class IdentityEvent extends AuthEvent {
  IdentityEvent({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class LogOutEvent extends AuthEvent {
  LogOutEvent({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
