import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/nomenclatures_parametrs_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';

part 'nomenclatures_parametrs_event.dart';
part 'nomenclatures_parametrs_state.dart';

class NomenclaturesParametrsBloc
    extends Bloc<NomenclaturesParametrsEvent, NomenclaturesParametrsState> {
  NomenclaturesParametrsBloc(this.paramsNomRepo, this.unitsRepo)
      : super(NomenclaturesParametrsInitialState()) {
    // ,this.taskRepo
    on<LoadNomenclaturesParametrsListEvent>(_loadNomenclaturesParametrsList);
    on<LoadNextNomenclaturesParametrsListEvent>(
        _loadNextNomenclaturesParametrsList);
    on<CreateNewNomenclaturesParametrsEvent>(_createNewNomenclaturesParametrs);
    on<EditNomenclaturesParametrsEvent>(_editNomenclaturesParametrs);
    on<DeleteNomenclaturesParametrsEvent>(_deleteNomenclaturesParametrs);
    on<LoadNomenclaturesParametrsDetailEvent>(
        _loadNomenclaturesParametrsDetail);
  }

  final NomenclaturesParametrsRepo paramsNomRepo;
  final UnitsRepo unitsRepo;

  Future<void> _loadNomenclaturesParametrsList(
    LoadNomenclaturesParametrsListEvent event,
    Emitter<NomenclaturesParametrsState> emit,
  ) async {
    try {
      if (state is! NomenclaturesParametrsListLoadedState) {
        emit(NomenclaturesParametrsListLoadingState());
      }

      final (paramsNomList, countAll) =
          await paramsNomRepo.getNomenclaturesParametrsList(
        page_size: NomenclaturesParametrsState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      final unitsList = await unitsRepo.getUnitShort();
      bool isEnd = NomenclaturesParametrsState.showCount >= countAll;
      emit(NomenclaturesParametrsListLoadedState(
        paramsNomList: paramsNomList,
        unitsList: unitsList,
        countAll: countAll,
        isEnd: isEnd,
        limit: NomenclaturesParametrsState.showCount,
      ));
    } catch (e, _) {
      emit(NomenclaturesParametrsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextNomenclaturesParametrsList(
    LoadNextNomenclaturesParametrsListEvent event,
    Emitter<NomenclaturesParametrsState> emit,
  ) async {
    try {
      if (state is! NomenclaturesParametrsListLoadedState) {
        emit(NomenclaturesParametrsListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + NomenclaturesParametrsState.showCount;
      final (paramsNomList, countAll) =
          await paramsNomRepo.getNomenclaturesParametrsList(
        page_size: newLimit,
        page: 1,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as NomenclaturesParametrsListLoadedState).copyWith(
          paramsNomList: paramsNomList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(NomenclaturesParametrsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewNomenclaturesParametrs(
    CreateNewNomenclaturesParametrsEvent event,
    Emitter<NomenclaturesParametrsState> emit,
  ) async {
    try {
      final NomenclaturesParametrs newNomenclaturesParametrs =
          await paramsNomRepo.createNewNomenclaturesParametrs(
        name: event.name,
        description: event.description,
        unit: event.unit!,
      );

      emit((state as NomenclaturesParametrsListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          paramsNomList: [newNomenclaturesParametrs, ...state.paramsNomList!]));
    } catch (e, _) {
      emit(NomenclaturesParametrsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editNomenclaturesParametrs(
    EditNomenclaturesParametrsEvent event,
    Emitter<NomenclaturesParametrsState> emit,
  ) async {
    try {
      final NomenclaturesParametrs editedNomenclaturesParametrs =
          await paramsNomRepo.editNomenclaturesParametrs(
        id: event.id,
        name: event.name,
        description: event.description,
        unit: event.unit,
      );

      if (state is NomenclaturesParametrsListLoadedState ||
          state is NomenclaturesParametrsListLoadingState) {
        List<NomenclaturesParametrs> newList = [];
        for (NomenclaturesParametrs unitsList in state.paramsNomList!) {
          if (unitsList.id == editedNomenclaturesParametrs.id) {
            newList.add(editedNomenclaturesParametrs);
          } else {
            newList.add(unitsList);
          }
        }
        emit((state as NomenclaturesParametrsListLoadedState)
            .copyWith(paramsNomList: newList));
      }
      if (state is NomenclaturesParametrsDetailLoadedState ||
          state is NomenclaturesParametrsDetailLoadingState) {
        emit((state as NomenclaturesParametrsDetailLoadedState)
            .copyWith(paramsNom: editedNomenclaturesParametrs));
      }
    } catch (e, _) {
      emit(NomenclaturesParametrsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _deleteNomenclaturesParametrs(
    DeleteNomenclaturesParametrsEvent event,
    Emitter<NomenclaturesParametrsState> emit,
  ) async {
    try {
      await paramsNomRepo.deleteNomenclaturesParametrs(
          id: event.id); //(unitsListId: event.id)
      List<NomenclaturesParametrs> newList = [];
      for (NomenclaturesParametrs unitsList in state.paramsNomList!) {
        if (unitsList.id != event.id) {
          newList.add(unitsList);
        }
      }
      emit((state as NomenclaturesParametrsListLoadedState).copyWith(
          paramsNomList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(NomenclaturesParametrsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _loadNomenclaturesParametrsDetail(
    LoadNomenclaturesParametrsDetailEvent event,
    Emitter<NomenclaturesParametrsState> emit,
  ) async {
    try {
      final paramsNom =
          await paramsNomRepo.getNomenclaturesParametrsDetail(event.id);
      final unitsList = await unitsRepo.getUnitShort();

      emit(NomenclaturesParametrsDetailLoadedState(
        paramsNom: paramsNom,
        unitsList: unitsList,
      )); //, projectList: projectList
    } catch (e, _) {
      emit(NomenclaturesParametrsLoadingFailureState(exception: e));
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
