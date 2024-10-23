import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_short.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';

part 'storerooms_event.dart';
part 'storerooms_state.dart';

class StoreroomBloc extends Bloc<StoreroomEvent, StoreroomState> {
  StoreroomBloc(this.storeroomRepo, this.organizationRepo, this.departmentepo)
      : super(StoreroomInitialState()) {
    // ,this.taskRepo
    on<LoadStoreroomListEvent>(_loadStoreroomList);
    on<LoadNextStoreroomListEvent>(_loadNextStoreroomList);
    on<CreateNewStoreroomEvent>(_createNewStoreroom);
    on<EditStoreroomEvent>(_editStoreroom);
    on<DeleteStoreroomEvent>(_deleteStoreroom);
    on<LoadStoreroomDetailEvent>(_loadStoreroomDetail);
  }

  final StoreroomRepo storeroomRepo;
  final OrganizationRepo organizationRepo;
  final DepartmentRepo departmentepo;
  // final TaskRepo taskRepo;

  Future<void> _loadStoreroomList(
    LoadStoreroomListEvent event,
    Emitter<StoreroomState> emit,
  ) async {
    try {
      if (state is! StoreroomListLoadedState) {
        emit(StoreroomListLoadingState());
      }
      final (storeroomList, countAll) = await storeroomRepo.getStoreroomList(
        page_size: StoreroomState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      final orgList = await organizationRepo.getOrganizationsShort();

      bool isEnd = StoreroomState.showCount >= countAll;
      emit(StoreroomListLoadedState(
        storeroomList: storeroomList,
        orgList: orgList,
        countAll: countAll,
        isEnd: isEnd,
        limit: StoreroomState.showCount,
      ));
    } catch (e, _) {
      emit(StoreroomLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextStoreroomList(
    LoadNextStoreroomListEvent event,
    Emitter<StoreroomState> emit,
  ) async {
    try {
      if (state is! StoreroomListLoadedState) {
        emit(StoreroomListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + StoreroomState.showCount;
      final (storeroomList, countAll) = await storeroomRepo.getStoreroomList(
        page_size: newLimit,
        page: 1,
        // searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as StoreroomListLoadedState).copyWith(
          storeroomList: storeroomList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(StoreroomLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewStoreroom(
    CreateNewStoreroomEvent event,
    Emitter<StoreroomState> emit,
  ) async {
    try {
      final Storeroom newStoreroom = await storeroomRepo.createNewStoreroom(
        name: event.name,
        description: event.description,
        organization: event.organization.toString(),
      );

      emit((state as StoreroomListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          storeroomList: [newStoreroom, ...state.storeroomList!]));
    } catch (e, _) {
      emit(StoreroomLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editStoreroom(
    EditStoreroomEvent event,
    Emitter<StoreroomState> emit,
  ) async {
    try {
      final Storeroom editedStoreroom = await storeroomRepo.editStoreroom(
        id: event.id,
        name: event.name,
        description: event.description,
        organization: event.organization.toString(),
      );
      if (state is StoreroomListLoadedState ||
          state is StoreroomListLoadingState) {
        List<Storeroom> newList = [];
        for (Storeroom storeroom in state.storeroomList!) {
          if (storeroom.id == editedStoreroom.id) {
            newList.add(editedStoreroom);
          } else {
            newList.add(storeroom);
          }
        }
        emit((state as StoreroomListLoadedState)
            .copyWith(storeroomList: newList));
      }
      if (state is StoreroomDetailLoadedState ||
          state is StoreroomDetailLoadingState) {
        emit((state as StoreroomDetailLoadedState)
            .copyWith(storeroom: editedStoreroom));
      }
    } catch (e, _) {
      emit(StoreroomLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _deleteStoreroom(
    DeleteStoreroomEvent event,
    Emitter<StoreroomState> emit,
  ) async {
    try {
      await storeroomRepo.deleteStoreroom(
          id: event.id); //(storeroomId: event.id)
      List<Storeroom> newList = [];
      for (Storeroom storeroom in state.storeroomList!) {
        if (storeroom.id != event.id) {
          newList.add(storeroom);
        }
      }
      emit((state as StoreroomListLoadedState).copyWith(
          storeroomList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(StoreroomLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _loadStoreroomDetail(
    LoadStoreroomDetailEvent event,
    Emitter<StoreroomState> emit,
  ) async {
    try {
      final storeroom = await storeroomRepo.getStoreroomDetail(event.id);
      final orgList = await organizationRepo.getOrganizationsShort();

      emit(StoreroomDetailLoadedState(
        storeroom: storeroom,
        orgList: orgList,
      )); //, projectList: projectList
    } catch (e, _) {
      emit(StoreroomLoadingFailureState(exception: e));
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
