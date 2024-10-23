import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department_short.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_short.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/group.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepo, this.organizationRepo, this.departmentepo)
      : super(UserInitialState()) {
    // ,this.taskRepo
    on<LoadUserListEvent>(_loadUserList);
    on<LoadNextUserListEvent>(_loadNextUserList);
    on<CreateNewUserEvent>(_createNewUser);
    on<EditUserEvent>(_editUser);
    on<DeleteUserEvent>(_deleteUser);
    on<ChangeUserPasswordEvent>(_changeUserPassword);
    on<LoadUserDetailEvent>(_loadUserDetail);
  }

  final UserRepo userRepo;
  final OrganizationRepo organizationRepo;
  final DepartmentRepo departmentepo;
  // final TaskRepo taskRepo;

  Future<void> _loadUserList(
    LoadUserListEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      if (state is! UserListLoadedState) {
        emit(UserListLoadingState());
      }
      final (userList, countAll) = await userRepo.getUserList(
        page_size: UserState.showCount,
        page: 1,
        searchText: event.searchText,
        // is_staff: event.filterIsStaff,
        // is_active: event.filterIsActive,
        // is_superuser: event.filterIsSuperUser,
      );
      // final projectList = await taskRepo.getProjectsShort();
      final groupList = await userRepo.getGroupsShort();
      final orgList = await organizationRepo.getOrganizationsShort();
      final deptList = await departmentepo.getDepartmentsShort();

      bool isEnd = UserState.showCount >= countAll;
      emit(UserListLoadedState(
        userList: userList,
        groupList: groupList,
        orgList: orgList,
        deptList: deptList,
        countAll: countAll,
        isEnd: isEnd,
        limit: UserState.showCount,
      ));
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextUserList(
    LoadNextUserListEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      if (state is! UserListLoadedState) {
        emit(UserListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + UserState.showCount;
      final (userList, countAll) = await userRepo.getUserList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
        // is_staff: event.filterIsStaff,
        // is_active: event.filterIsActive,
        // is_superuser: event.filterIsSuperUser,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as UserListLoadedState).copyWith(
          userList: userList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewUser(
    CreateNewUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final User newUser = await userRepo.createNewUser(
        first_name: event.first_name,
        last_name: event.last_name,
        surname: event.surname,
        email: event.email,
        password: event.password,
        organization: event.organization.toString(),
        department: event.department.toString(),
        username: event.username.toString(),
        is_staff: event.is_staff,
        is_superuser: event.is_superuser,
        groups: event.groups,
        telegram_id: event.telegram_id,
      );

      emit((state as UserListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          userList: [newUser, ...state.userList!]));
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editUser(
    EditUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final User editedUser = await userRepo.editUser(
        id: event.id,
        first_name: event.first_name,
        last_name: event.last_name,
        surname: event.surname,
        email: event.email,
        organization: event.organization.toString(),
        department: event.department.toString(),
        username: event.username,
        is_staff: event.is_staff,
        // is_active: event.is_active,
        is_superuser: event.is_superuser,
        groups: event.groups,
        telegram_id: event.telegram_id,
      );
      if (state is UserListLoadedState || state is UserListLoadingState) {
        List<User> newList = [];
        for (User user in state.userList!) {
          if (user.id == editedUser.id) {
            newList.add(editedUser);
          } else {
            newList.add(user);
          }
        }
        emit((state as UserListLoadedState).copyWith(userList: newList));
      }
      if (state is UserDetailLoadedState || state is UserDetailLoadingState) {
        emit((state as UserDetailLoadedState).copyWith(user: editedUser));
      }
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _deleteUser(
    DeleteUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await userRepo.deleteUser(id: event.id); //(userId: event.id)
      List<User> newList = [];
      for (User user in state.userList!) {
        if (user.id != event.id) {
          newList.add(user);
        }
      }
      emit((state as UserListLoadedState).copyWith(
          userList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _changeUserPassword(
    ChangeUserPasswordEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await userRepo.changeUserPassword(
          userId: event.id, password: event.password);
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _loadUserDetail(
    LoadUserDetailEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final user = await userRepo.getUserDetail(event.id);

      final groupList = await userRepo.getGroupsShort();
      final orgList = await organizationRepo.getOrganizationsShort();
      final deptList = await departmentepo.getDepartmentsShort();

      emit(UserDetailLoadedState(
        user: user,
        groupList: groupList,
        orgList: orgList,
        deptList: deptList,
      )); //, projectList: projectList
    } catch (e, _) {
      emit(UserLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }
}
