import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/directions_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/models/directions_of_ops.dart';

part 'directions_of_ops_event.dart';
part 'directions_of_ops_state.dart';

class DirectionsOpsBloc extends Bloc<DirectionsOpsEvent, DirectionsOpsState> {
  DirectionsOpsBloc(
    this.directionsOpsRepo,
  ) : super(DirectionsOpsInitialState()) {
    // ,this.taskRepo
    on<LoadDirectionsOpsListEvent>(_loadDirectionsOpsList);
    on<LoadNextDirectionsOpsListEvent>(_loadNextDirectionsOpsList);
    on<CreateNewDirectionsOpsEvent>(_createNewDirectionsOps);
    on<EditDirectionsOpsEvent>(_editDirectionsOps);
    on<DeleteDirectionsOpsEvent>(_deleteDirectionsOps);
    on<LoadDirectionsOpsDetailEvent>(_loadDirectionsOpsDetail);
  }

  final DirectionsOpsRepo directionsOpsRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadDirectionsOpsList(
    LoadDirectionsOpsListEvent event,
    Emitter<DirectionsOpsState> emit,
  ) async {
    try {
      if (state is! DirectionsOpsListLoadedState) {
        emit(DirectionsOpsListLoadingState());
      }
      final (directionsOpsList, countAll) =
          await directionsOpsRepo.getDirectionsOpsList(
        page_size: DirectionsOpsState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = DirectionsOpsState.showCount >= countAll;
      emit(DirectionsOpsListLoadedState(
        directionsOpsList: directionsOpsList,
        countAll: countAll,
        isEnd: isEnd,
        limit: DirectionsOpsState.showCount,
      ));
    } catch (e, _) {
      emit(DirectionsOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextDirectionsOpsList(
    LoadNextDirectionsOpsListEvent event,
    Emitter<DirectionsOpsState> emit,
  ) async {
    try {
      if (state is! DirectionsOpsListLoadedState) {
        emit(DirectionsOpsListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + DirectionsOpsState.showCount;
      final (directionsOpsList, countAll) =
          await directionsOpsRepo.getDirectionsOpsList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as DirectionsOpsListLoadedState).copyWith(
          directionsOpsList: directionsOpsList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(DirectionsOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewDirectionsOps(
    CreateNewDirectionsOpsEvent event,
    Emitter<DirectionsOpsState> emit,
  ) async {
    try {
      final DirectionsOps newDirectionsOps =
          await directionsOpsRepo.createNewDirectionsOps(
        name: event.name!,
        description: event.description!,
      );

      emit((state as DirectionsOpsListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          directionsOpsList: [newDirectionsOps, ...state.directionsOpsList!]));
    } catch (e, _) {
      emit(DirectionsOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editDirectionsOps(
    EditDirectionsOpsEvent event,
    Emitter<DirectionsOpsState> emit,
  ) async {
    try {
      final DirectionsOps editedDirectionsOps =
          await directionsOpsRepo.editDirectionsOpsRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is DirectionsOpsListLoadedState ||
          state is DirectionsOpsListLoadingState) {
        List<DirectionsOps> newList = [];
        for (DirectionsOps directionsOps in state.directionsOpsList!) {
          if (directionsOps.id == editedDirectionsOps.id) {
            newList.add(editedDirectionsOps);
          } else {
            newList.add(directionsOps);
          }
        }

        emit((state as DirectionsOpsListLoadedState)
            .copyWith(directionsOpsList: newList));
      }
      if (state is DirectionsOpsDetailLoadedState ||
          state is DirectionsOpsDetailLoadingState) {
        emit((state as DirectionsOpsDetailLoadedState)
            .copyWith(directionsOps: editedDirectionsOps));
      }
    } catch (e, _) {
      emit(DirectionsOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteDirectionsOps(
    DeleteDirectionsOpsEvent event,
    Emitter<DirectionsOpsState> emit,
  ) async {
    try {
      await directionsOpsRepo.deleteDirectionsOps(
          id: event.id); //(directionsOpsId: event.id)
      List<DirectionsOps> newList = [];
      for (DirectionsOps directionsOps in state.directionsOpsList!) {
        if (directionsOps.id != event.id) {
          newList.add(directionsOps);
        }
      }
      emit((state as DirectionsOpsListLoadedState).copyWith(
          directionsOpsList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(DirectionsOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadDirectionsOpsDetail(
  //   LoadDirectionsOpsDetailEvent event,
  //   Emitter<DirectionsOpsState> emit,
  // ) async {
  //   try {
  //     final directionsOps =
  //         await directionsOpsRepo.getDirectionsOpsDetail(event.id);

  //     emit(DirectionsOpsDetailLoadedState(
  //       directionsOps: directionsOps,
  //     ));
  //   } catch (e, _) {
  //     emit(DirectionsOpsLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadDirectionsOpsDetail(
    LoadDirectionsOpsDetailEvent event,
    Emitter<DirectionsOpsState> emit,
  ) async {
    try {
      final directionsOps =
          await directionsOpsRepo.getDirectionsOpsDetail(event.id);

      emit(DirectionsOpsDetailLoadedState(
        directionsOps: directionsOps,
      ));
    } catch (e, _) {
      emit(DirectionsOpsLoadingFailureState(exception: e));
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
