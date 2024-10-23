part of 'form_return_bloc.dart';

class FormReturnState extends Equatable {
  final FormReturn? formReturn;
  final List<UserShort>? userList;

  const FormReturnState({
    this.formReturn,
    this.userList,
  });

  FormLoadedState copyWith({
    List<UserShort>? userList,
  }) {
    return FormLoadedState(
      userList: userList ?? this.userList,
    );
  }

  @override
  List<Object?> get props => [
        userList,
      ];
}

class FormInitialState extends FormReturnState {
  @override
  List<Object?> get props => [];
}

class FormReturnStateLoadingState extends FormReturnState {
  @override
  List<Object?> get props => [];
}

class FormLoadedState extends FormReturnState {
  const FormLoadedState({
    super.userList,
  });

  @override
  List<Object?> get props => [userList];
}

class FormReturnFailureState extends FormReturnState {
  const FormReturnFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class FormReturnSuccessSavedState extends FormReturnState {
  final String jsonString;

  const FormReturnSuccessSavedState({
    required this.jsonString,
    super.formReturn,
  });
  @override
  List<Object?> get props => [jsonString, formReturn];
}
