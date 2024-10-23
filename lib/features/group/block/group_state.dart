part of 'group_bloc.dart';

class GroupState extends Equatable {
  const GroupState({
    this.groupList,
    // this.userList,
  });

  final List<Group>? groupList;
  // final List<UserShort>? userList;

  @override
  List<Object?> get props => [groupList]; // , userList
}

class GroupListInitialState extends GroupState {
  @override
  List<Object?> get props => [];
}

class GroupListLoadingState extends GroupState {
  @override
  List<Object?> get props => [];
}

class GroupListLoadedState extends GroupState {
  const GroupListLoadedState({
    required super.groupList,
    // required super.userList,
  });

  GroupListLoadedState copyWith({
    List<Group>? groupList,
    List<UserShort>? userList,
  }) {
    return GroupListLoadedState(
      groupList: groupList ?? this.groupList,
      // userList: userList ?? this.userList,
    );
  }

  @override
  List<Object?> get props => [groupList]; //, userList
}

class GroupListLoadingFailureState extends GroupState {
  const GroupListLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
