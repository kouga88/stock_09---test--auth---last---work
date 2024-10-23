import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/mission_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/models/mission_of_ops.dart';

part 'mission_of_ops_event.dart';
part 'mission_of_ops_state.dart';

class MissionOperationsBloc
    extends Bloc<MissionOperationsEvent, MissionOperationsState> {
  MissionOperationsBloc(
    this.missionOperationsRepo,
  ) : super(MissionOperationsInitialState()) {
    // ,this.taskRepo
    on<LoadMissionOperationsListEvent>(_loadMissionOperationsList);
    on<LoadNextMissionOperationsListEvent>(_loadNextMissionOperationsList);
    on<CreateNewMissionOperationsEvent>(_createNewMissionOperations);
    on<EditMissionOperationsEvent>(_editMissionOperations);
    on<DeleteMissionOperationsEvent>(_deleteMissionOperations);
    on<LoadMissionOperationsDetailEvent>(_loadMissionOperationsDetail);
  }

  final MissionOperationsRepo missionOperationsRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadMissionOperationsList(
    LoadMissionOperationsListEvent event,
    Emitter<MissionOperationsState> emit,
  ) async {
    try {
      if (state is! MissionOperationsListLoadedState) {
        emit(MissionOperationsListLoadingState());
      }
      final (missionOperationsList, countAll) =
          await missionOperationsRepo.getMissionOperationsList(
        page_size: MissionOperationsState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = MissionOperationsState.showCount >= countAll;
      emit(MissionOperationsListLoadedState(
        missionOperationsList: missionOperationsList,
        countAll: countAll,
        isEnd: isEnd,
        limit: MissionOperationsState.showCount,
      ));
    } catch (e, _) {
      emit(MissionOperationsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextMissionOperationsList(
    LoadNextMissionOperationsListEvent event,
    Emitter<MissionOperationsState> emit,
  ) async {
    try {
      if (state is! MissionOperationsListLoadedState) {
        emit(MissionOperationsListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + MissionOperationsState.showCount;
      final (missionOperationsList, countAll) =
          await missionOperationsRepo.getMissionOperationsList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as MissionOperationsListLoadedState).copyWith(
          missionOperationsList: missionOperationsList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(MissionOperationsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewMissionOperations(
    CreateNewMissionOperationsEvent event,
    Emitter<MissionOperationsState> emit,
  ) async {
    try {
      final MissionOperations newMissionOperations =
          await missionOperationsRepo.createNewMissionOperations(
        name: event.name!,
        description: event.description!,
      );

      emit((state as MissionOperationsListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          missionOperationsList: [
            newMissionOperations,
            ...state.missionOperationsList!
          ]));
    } catch (e, _) {
      emit(MissionOperationsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editMissionOperations(
    EditMissionOperationsEvent event,
    Emitter<MissionOperationsState> emit,
  ) async {
    try {
      final MissionOperations editedMissionOperations =
          await missionOperationsRepo.editMissionOperationsRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is MissionOperationsListLoadedState ||
          state is MissionOperationsListLoadingState) {
        List<MissionOperations> newList = [];
        for (MissionOperations missionOperations
            in state.missionOperationsList!) {
          if (missionOperations.id == editedMissionOperations.id) {
            newList.add(editedMissionOperations);
          } else {
            newList.add(missionOperations);
          }
        }

        emit((state as MissionOperationsListLoadedState)
            .copyWith(missionOperationsList: newList));
      }
      if (state is MissionOperationsDetailLoadedState ||
          state is MissionOperationsDetailLoadingState) {
        emit((state as MissionOperationsDetailLoadedState)
            .copyWith(missionOperations: editedMissionOperations));
      }
    } catch (e, _) {
      emit(MissionOperationsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteMissionOperations(
    DeleteMissionOperationsEvent event,
    Emitter<MissionOperationsState> emit,
  ) async {
    try {
      await missionOperationsRepo.deleteMissionOperations(
          id: event.id); //(missionOperationsId: event.id)
      List<MissionOperations> newList = [];
      for (MissionOperations missionOperations
          in state.missionOperationsList!) {
        if (missionOperations.id != event.id) {
          newList.add(missionOperations);
        }
      }
      emit((state as MissionOperationsListLoadedState).copyWith(
          missionOperationsList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(MissionOperationsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadMissionOperationsDetail(
  //   LoadMissionOperationsDetailEvent event,
  //   Emitter<MissionOperationsState> emit,
  // ) async {
  //   try {
  //     final missionOperations =
  //         await missionOperationsRepo.getMissionOperationsDetail(event.id);

  //     emit(MissionOperationsDetailLoadedState(
  //       missionOperations: missionOperations,
  //     ));
  //   } catch (e, _) {
  //     emit(MissionOperationsLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadMissionOperationsDetail(
    LoadMissionOperationsDetailEvent event,
    Emitter<MissionOperationsState> emit,
  ) async {
    try {
      final missionOperations =
          await missionOperationsRepo.getMissionOperationsDetail(event.id);

      emit(MissionOperationsDetailLoadedState(
        missionOperations: missionOperations,
      ));
    } catch (e, _) {
      emit(MissionOperationsLoadingFailureState(exception: e));
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
