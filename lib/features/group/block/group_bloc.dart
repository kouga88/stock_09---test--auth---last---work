// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/group.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_short.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc(this.userRepo) : super(GroupListInitialState()) {
    on<LoadGroupListEvent>(_loadGroupList);
    on<CreateNewGroupEvent>(_createNewGroup);
    on<EditGroupEvent>(_editGroup);
    on<DeleteGroupEvent>(_deleteGroup);
    // on<IncludeUserEvent>(_includeUser);
    // on<ExcludeUserEvent>(_excludeUser);
  }

  final UserRepo userRepo;
  Future<void> _loadGroupList(
    LoadGroupListEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      if (state is! GroupListLoadedState) {
        emit(GroupListLoadingState());
      }
      final groupList = await userRepo.getGroupsShort();
      // final userList = await userRepo.getUserShort();
      emit(GroupListLoadedState(
        groupList: groupList,

        // userList: userList,
      ));
    } catch (e, _) {
      emit(GroupListLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewGroup(
    CreateNewGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      final Group newGroup = await userRepo.createNewGroup(name: event.name);

      emit((state as GroupListLoadedState)
          .copyWith(groupList: [newGroup, ...state.groupList!]));
    } catch (e, _) {
      emit(GroupListLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editGroup(
    EditGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      final Group editedGroup = await userRepo.editGroup(name: event.name);

      List<Group> newList = [];
      for (Group group in state.groupList!) {
        newList.add(group);
      }
      emit((state as GroupListLoadedState).copyWith(groupList: newList));
    } catch (e, _) {
      emit(GroupListLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _deleteGroup(
    DeleteGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      await userRepo.deleteGroup(name: event.name);
      List<Group> newList = [];
      for (Group group in state.groupList!) {
        if (group.name != event.name) {
          newList.add(group);
        }
      }
      emit((state as GroupListLoadedState).copyWith(groupList: newList));
    } catch (e, _) {
      emit(GroupListLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // Future<void> _includeUser(
  //   IncludeUserEvent event,
  //   Emitter<GroupState> emit,
  // ) async {
  //   try {
  //     final Group editedGroup = await userRepo.includeUser(
  //         id: event.id, userId: event.userId);
  //     List<Group> newList = [];
  //     for (Group group in state.groupList!) {
  //       if (group.id == editedGroup.id) {
  //         newList.add(editedGroup);
  //       } else {
  //         newList.add(group);
  //       }
  //     }
  //     emit((state as GroupListLoadedState).copyWith(groupList: newList));
  //   } catch (e, _) {
  //     emit(GroupListLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  // Future<void> _excludeUser(
  //   ExcludeUserEvent event,
  //   Emitter<GroupState> emit,
  // ) async {
  //   try {
  //     final Group editedGroup = await userRepo.excludeUser(
  //         id: event.id, userId: event.userId);
  //     List<Group> newList = [];
  //     for (Group group in state.groupList!) {
  //       if (group.id == editedGroup.id) {
  //         newList.add(editedGroup);
  //       } else {
  //         newList.add(group);
  //       }
  //     }
  //     emit((state as GroupListLoadedState).copyWith(groupList: newList));
  //   } catch (e, _) {
  //     emit(GroupListLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }
}
