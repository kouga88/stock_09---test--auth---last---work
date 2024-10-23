import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';

part 'units_event.dart';
part 'units_state.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  UnitsBloc(
    this.unitsRepo,
  ) : super(UnitsInitialState()) {
    // ,this.taskRepo
    on<LoadUnitsListEvent>(_loadUnitsList);
    on<LoadNextUnitsListEvent>(_loadNextUnitsList);
    on<CreateNewUnitsEvent>(_createNewUnits);
    on<EditUnitsEvent>(_editUnits);
    on<DeleteUnitsEvent>(_deleteUnits);
    on<LoadUnitsDetailEvent>(_loadUnitsDetail);
  }

  final UnitsRepo unitsRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadUnitsList(
    LoadUnitsListEvent event,
    Emitter<UnitsState> emit,
  ) async {
    try {
      if (state is! UnitsListLoadedState) {
        emit(UnitsListLoadingState());
      }
      final (unitsList, countAll) = await unitsRepo.getUnitsList(
        page_size: UnitsState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = UnitsState.showCount >= countAll;
      emit(UnitsListLoadedState(
        unitsList: unitsList,
        countAll: countAll,
        isEnd: isEnd,
        limit: UnitsState.showCount,
      ));
    } catch (e, _) {
      emit(UnitsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextUnitsList(
    LoadNextUnitsListEvent event,
    Emitter<UnitsState> emit,
  ) async {
    try {
      if (state is! UnitsListLoadedState) {
        emit(UnitsListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + UnitsState.showCount;
      final (unitsList, countAll) = await unitsRepo.getUnitsList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as UnitsListLoadedState).copyWith(
          unitsList: unitsList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(UnitsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewUnits(
    CreateNewUnitsEvent event,
    Emitter<UnitsState> emit,
  ) async {
    try {
      final Units newUnits = await unitsRepo.createNewUnits(
        full_name: event.full_name!,
        short_name: event.short_name!,
        description: event.description!,
      );

      emit((state as UnitsListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          unitsList: [newUnits, ...state.unitsList!]));
    } catch (e, _) {
      emit(UnitsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editUnits(
    EditUnitsEvent event,
    Emitter<UnitsState> emit,
  ) async {
    try {
      final Units editedUnits = await unitsRepo.editUnitsRepo(
        id: event.id,
        full_name: event.full_name,
        short_name: event.short_name,
        description: event.description,
      );

      if (state is UnitsListLoadedState || state is UnitsListLoadingState) {
        List<Units> newList = [];
        for (Units units in state.unitsList!) {
          if (units.id == editedUnits.id) {
            newList.add(editedUnits);
          } else {
            newList.add(units);
          }
        }

        emit((state as UnitsListLoadedState).copyWith(unitsList: newList));
      }
      if (state is UnitsDetailLoadedState || state is UnitsDetailLoadingState) {
        emit((state as UnitsDetailLoadedState).copyWith(units: editedUnits));
      }
    } catch (e, _) {
      emit(UnitsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteUnits(
    DeleteUnitsEvent event,
    Emitter<UnitsState> emit,
  ) async {
    try {
      await unitsRepo.deleteUnits(id: event.id); //(unitsId: event.id)
      List<Units> newList = [];
      for (Units units in state.unitsList!) {
        if (units.id != event.id) {
          newList.add(units);
        }
      }
      emit((state as UnitsListLoadedState).copyWith(
          unitsList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(UnitsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadUnitsDetail(
  //   LoadUnitsDetailEvent event,
  //   Emitter<UnitsState> emit,
  // ) async {
  //   try {
  //     final units =
  //         await unitsRepo.getUnitsDetail(event.id);

  //     emit(UnitsDetailLoadedState(
  //       units: units,
  //     ));
  //   } catch (e, _) {
  //     emit(UnitsLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadUnitsDetail(
    LoadUnitsDetailEvent event,
    Emitter<UnitsState> emit,
  ) async {
    try {
      final units = await unitsRepo.getUnitsDetail(event.id);

      emit(UnitsDetailLoadedState(
        units: units,
      ));
    } catch (e, _) {
      emit(UnitsLoadingFailureState(exception: e));
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
