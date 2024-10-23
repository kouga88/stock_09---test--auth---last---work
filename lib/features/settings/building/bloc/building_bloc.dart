import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/building_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/models/building.dart';

part 'building_event.dart';
part 'building_state.dart';

class BuildingBloc extends Bloc<BuildingEvent, BuildingState> {
  BuildingBloc(
    this.buildingRepo,
  ) : super(BuildingInitialState()) {
    // ,this.taskRepo
    on<LoadBuildingListEvent>(_loadBuildingList);
    on<LoadNextBuildingListEvent>(_loadNextBuildingList);
    on<CreateNewBuildingEvent>(_createNewBuilding);
    on<EditBuildingEvent>(_editBuilding);
    on<DeleteBuildingEvent>(_deleteBuilding);
    on<LoadBuildingDetailEvent>(_loadBuildingDetail);
  }

  final BuildingRepo buildingRepo;

  Future<void> _loadBuildingList(
    LoadBuildingListEvent event,
    Emitter<BuildingState> emit,
  ) async {
    try {
      if (state is! BuildingListLoadedState) {
        emit(BuildingListLoadingState());
      }
      final (buildingList, countAll) = await buildingRepo.getBuildingList(
        page_size: BuildingState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = BuildingState.showCount >= countAll;
      emit(BuildingListLoadedState(
        buildingList: buildingList,
        countAll: countAll,
        isEnd: isEnd,
        limit: BuildingState.showCount,
      ));
    } catch (e, _) {
      emit(BuildingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextBuildingList(
    LoadNextBuildingListEvent event,
    Emitter<BuildingState> emit,
  ) async {
    try {
      if (state is! BuildingListLoadedState) {
        emit(BuildingListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + BuildingState.showCount;
      final (buildingList, countAll) = await buildingRepo.getBuildingList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as BuildingListLoadedState).copyWith(
          buildingList: buildingList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(BuildingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewBuilding(
    CreateNewBuildingEvent event,
    Emitter<BuildingState> emit,
  ) async {
    try {
      final Building newBuilding = await buildingRepo.createNewBuilding(
        name: event.name!,
        description: event.description!,
        status: event.status!,
      );

      emit((state as BuildingListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          buildingList: [newBuilding, ...state.buildingList!]));
    } catch (e, _) {
      emit(BuildingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editBuilding(
    EditBuildingEvent event,
    Emitter<BuildingState> emit,
  ) async {
    try {
      final Building editedBuilding = await buildingRepo.editBuildingRepo(
        id: event.id,
        name: event.name,
        description: event.description,
        status: event.status,
      );

      if (state is BuildingListLoadedState ||
          state is BuildingListLoadingState) {
        List<Building> newList = [];
        for (Building building in state.buildingList!) {
          if (building.id == editedBuilding.id) {
            newList.add(editedBuilding);
          } else {
            newList.add(building);
          }
        }

        emit(
            (state as BuildingListLoadedState).copyWith(buildingList: newList));
      }
      if (state is BuildingDetailLoadedState ||
          state is BuildingDetailLoadingState) {
        emit((state as BuildingDetailLoadedState)
            .copyWith(building: editedBuilding));
      }
    } catch (e, _) {
      emit(BuildingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteBuilding(
    DeleteBuildingEvent event,
    Emitter<BuildingState> emit,
  ) async {
    try {
      await buildingRepo.deleteBuilding(id: event.id); //(buildingId: event.id)
      List<Building> newList = [];
      for (Building building in state.buildingList!) {
        if (building.id != event.id) {
          newList.add(building);
        }
      }
      emit((state as BuildingListLoadedState).copyWith(
          buildingList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(BuildingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadBuildingDetail(
  //   LoadBuildingDetailEvent event,
  //   Emitter<BuildingState> emit,
  // ) async {
  //   try {
  //     final building =
  //         await buildingRepo.getBuildingDetail(event.id);

  //     emit(BuildingDetailLoadedState(
  //       building: building,
  //     ));
  //   } catch (e, _) {
  //     emit(BuildingLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadBuildingDetail(
    LoadBuildingDetailEvent event,
    Emitter<BuildingState> emit,
  ) async {
    try {
      final building = await buildingRepo.getBuildingDetail(event.id);

      emit(BuildingDetailLoadedState(
        building: building,
      ));
    } catch (e, _) {
      emit(BuildingLoadingFailureState(exception: e));
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
