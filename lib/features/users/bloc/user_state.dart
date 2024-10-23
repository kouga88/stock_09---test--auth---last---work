part of 'user_bloc.dart';

class UserState extends Equatable {
  static const int showCount = 20;

  const UserState({
    this.userList,
    this.groupList,
    this.orgList,
    this.deptList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.user,
  });

  final List<User>? userList;
  final List<Group>? groupList;
  final List<OrganizationShort>? orgList;
  final List<DepartmentShort>? deptList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final User? user;

  @override
  List<Object?> get props => [
        userList,
        countAll,
        limit,
        isEnd,
        user,
        groupList,
        orgList,
        deptList,
      ];
}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserListLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserListLoadedState extends UserState {
  const UserListLoadedState({
    required super.userList,
    required super.groupList,
    required super.orgList,
    required super.deptList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  UserListLoadedState copyWith({
    List<User>? userList,
    // List<ProjectShort>? projectList,
    List<Group>? groupList,
    List<OrganizationShort>? orgList,
    List<DepartmentShort>? deptList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return UserListLoadedState(
      userList: userList ?? this.userList,
      groupList: groupList ?? this.groupList,
      orgList: orgList ?? this.orgList,
      deptList: deptList ?? this.deptList,
      countAll: countAll ?? this.countAll,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [
        userList,
        orgList,
        deptList,
        countAll,
        limit,
        isEnd
      ]; // projectList, groupList,
}

class UserLoadingFailureState extends UserState {
  const UserLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class UserDetailLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDetailLoadedState extends UserState {
  const UserDetailLoadedState({
    required super.user,
    required super.groupList,
    required super.orgList,
    required super.deptList,
  });

  @override
  List<Object?> get props => [user]; // ,groupList, projectList

  UserDetailLoadedState copyWith({
    User? user,
    List<Group>? groupList,
    List<OrganizationShort>? orgList,
    List<DepartmentShort>? deptList,
  }) {
    return UserDetailLoadedState(
      user: user ?? this.user,
      groupList: groupList ?? this.groupList,
      orgList: orgList ?? this.orgList,
      deptList: deptList ?? this.deptList,
    );
  }
}
