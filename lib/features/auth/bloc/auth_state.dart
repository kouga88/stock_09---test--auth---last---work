part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthUnknownState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLogining extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthFailedState extends AuthState {
  AuthFailedState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class AuthSuccessedState extends AuthState {
  AuthSuccessedState({
    required this.user,
  });

  final User user;

  @override
  List<Object?> get props => [user];
}

class AuthSuccessedErrorState extends AuthState {
  AuthSuccessedErrorState({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

class AuthNotUserState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  AuthErrorState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
