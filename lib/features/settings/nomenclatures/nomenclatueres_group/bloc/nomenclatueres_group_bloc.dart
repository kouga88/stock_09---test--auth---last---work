import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/nomenclatueres_group_repo.dart';

part 'nomenclatueres_group_event.dart';
part 'nomenclatueres_group_state.dart';

class NomenclaturesGroupBloc
    extends Bloc<NomenclaturesGroupEvent, NomenclaturesGroupState> {
  NomenclaturesGroupBloc(
    this.nomenclaturesGroupRepo,
  ) : super(NomenclaturesGroupInitialState()) {
    // ,this.taskRepo
    on<LoadNomenclaturesGroupListEvent>(_loadNomenclaturesGroupList);
    on<LoadNextNomenclaturesGroupListEvent>(_loadNextNomenclaturesGroupList);
    on<CreateNewNomenclaturesGroupEvent>(_createNewNomenclaturesGroup);
    on<EditNomenclaturesGroupEvent>(_editNomenclaturesGroup);
    on<DeleteNomenclaturesGroupEvent>(_deleteNomenclaturesGroup);
    on<LoadNomenclaturesGroupDetailEvent>(_loadNomenclaturesGroupDetail);
  }

  final NomenclaturesGroupRepo nomenclaturesGroupRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadNomenclaturesGroupList(
    LoadNomenclaturesGroupListEvent event,
    Emitter<NomenclaturesGroupState> emit,
  ) async {
    try {
      if (state is! NomenclaturesGroupListLoadedState) {
        emit(NomenclaturesGroupListLoadingState());
      }
      final (nomenclaturesGroupList, countAll) =
          await nomenclaturesGroupRepo.getNomenclaturesGroupList(
        page_size: NomenclaturesGroupState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = NomenclaturesGroupState.showCount >= countAll;
      emit(NomenclaturesGroupListLoadedState(
        nomenclaturesGroupList: nomenclaturesGroupList,
        countAll: countAll,
        isEnd: isEnd,
        limit: NomenclaturesGroupState.showCount,
      ));
    } catch (e, _) {
      emit(NomenclaturesGroupLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextNomenclaturesGroupList(
    LoadNextNomenclaturesGroupListEvent event,
    Emitter<NomenclaturesGroupState> emit,
  ) async {
    try {
      if (state is! NomenclaturesGroupListLoadedState) {
        emit(NomenclaturesGroupListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + NomenclaturesGroupState.showCount;
      final (nomenclaturesGroupList, countAll) =
          await nomenclaturesGroupRepo.getNomenclaturesGroupList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as NomenclaturesGroupListLoadedState).copyWith(
          nomenclaturesGroupList: nomenclaturesGroupList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(NomenclaturesGroupLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewNomenclaturesGroup(
    CreateNewNomenclaturesGroupEvent event,
    Emitter<NomenclaturesGroupState> emit,
  ) async {
    try {
      final NomenclaturesGroup newNomenclaturesGroup =
          await nomenclaturesGroupRepo.createNewNomenclaturesGroup(
        name: event.name!,
        description: event.description!,
      );

      emit((state as NomenclaturesGroupListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          nomenclaturesGroupList: [
            newNomenclaturesGroup,
            ...state.nomenclaturesGroupList!
          ]));
    } catch (e, _) {
      emit(NomenclaturesGroupLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editNomenclaturesGroup(
    EditNomenclaturesGroupEvent event,
    Emitter<NomenclaturesGroupState> emit,
  ) async {
    try {
      final NomenclaturesGroup editedNomenclaturesGroup =
          await nomenclaturesGroupRepo.editNomenclaturesGroupRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is NomenclaturesGroupListLoadedState ||
          state is NomenclaturesGroupListLoadingState) {
        List<NomenclaturesGroup> newList = [];
        for (NomenclaturesGroup nomenclaturesGroup
            in state.nomenclaturesGroupList!) {
          if (nomenclaturesGroup.id == editedNomenclaturesGroup.id) {
            newList.add(editedNomenclaturesGroup);
          } else {
            newList.add(nomenclaturesGroup);
          }
        }

        emit((state as NomenclaturesGroupListLoadedState)
            .copyWith(nomenclaturesGroupList: newList));
      }
      if (state is NomenclaturesGroupDetailLoadedState ||
          state is NomenclaturesGroupDetailLoadingState) {
        emit((state as NomenclaturesGroupDetailLoadedState)
            .copyWith(nomenclaturesGroup: editedNomenclaturesGroup));
      }
    } catch (e, _) {
      emit(NomenclaturesGroupLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteNomenclaturesGroup(
    DeleteNomenclaturesGroupEvent event,
    Emitter<NomenclaturesGroupState> emit,
  ) async {
    try {
      await nomenclaturesGroupRepo.deleteNomenclaturesGroup(
          id: event.id); //(nomenclaturesGroupId: event.id)
      List<NomenclaturesGroup> newList = [];
      for (NomenclaturesGroup nomenclaturesGroup
          in state.nomenclaturesGroupList!) {
        if (nomenclaturesGroup.id != event.id) {
          newList.add(nomenclaturesGroup);
        }
      }
      emit((state as NomenclaturesGroupListLoadedState).copyWith(
          nomenclaturesGroupList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(NomenclaturesGroupLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadNomenclaturesGroupDetail(
  //   LoadNomenclaturesGroupDetailEvent event,
  //   Emitter<NomenclaturesGroupState> emit,
  // ) async {
  //   try {
  //     final nomenclaturesGroup =
  //         await nomenclaturesGroupRepo.getNomenclaturesGroupDetail(event.id);

  //     emit(NomenclaturesGroupDetailLoadedState(
  //       nomenclaturesGroup: nomenclaturesGroup,
  //     ));
  //   } catch (e, _) {
  //     emit(NomenclaturesGroupLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadNomenclaturesGroupDetail(
    LoadNomenclaturesGroupDetailEvent event,
    Emitter<NomenclaturesGroupState> emit,
  ) async {
    try {
      final nomenclaturesGroup =
          await nomenclaturesGroupRepo.getNomenclaturesGroupDetail(event.id);

      emit(NomenclaturesGroupDetailLoadedState(
        nomenclaturesGroup: nomenclaturesGroup,
      ));
    } catch (e, _) {
      emit(NomenclaturesGroupLoadingFailureState(exception: e));
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
