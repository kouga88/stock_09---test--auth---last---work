import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/nomenclatueres_group_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/nomenclatures_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/nomenclatures_parametrs_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';

part 'nomenclatures_event.dart';
part 'nomenclatures_state.dart';

class NomenclaturesBloc extends Bloc<NomenclaturesEvent, NomenclaturesState> {
  NomenclaturesBloc(this.nomenclaturesRepo, this.unitsRepo, this.stokRepo,
      this.paramRepo, this.groupRepo)
      : super(NomenclaturesInitialState()) {
    // ,this.taskRepo
    on<LoadNomenclaturesListEvent>(_loadNomenclaturesList);
    on<LoadNextNomenclaturesListEvent>(_loadNextNomenclaturesList);
    on<CreateNewNomenclaturesEvent>(_createNewNomenclatures);
    on<EditNomenclaturesEvent>(_editNomenclatures);
    on<DeleteNomenclaturesEvent>(_deleteNomenclatures);
    on<LoadNomenclaturesDetailEvent>(_loadNomenclaturesDetail);
  }

  final NomenclaturesRepo nomenclaturesRepo;
  final UnitsRepo unitsRepo;
  final StoreroomRepo stokRepo;
  final NomenclaturesParametrsRepo paramRepo;
  final NomenclaturesGroupRepo groupRepo;
  // final TaskRepo taskRepo;

  Future<void> _loadNomenclaturesList(
    LoadNomenclaturesListEvent event,
    Emitter<NomenclaturesState> emit,
  ) async {
    try {
      if (state is! NomenclaturesListLoadedState) {
        emit(NomenclaturesListLoadingState());
      }
      final (nomenclaturesList, countAll) =
          await nomenclaturesRepo.getNomenclaturesList(
        page_size: NomenclaturesState.showCount,
        page: 1,
        searchText: event.searchText,
      );
      final unitsList = await unitsRepo.getUnitShort();
      final storeroomList = await stokRepo.getStoreroomShort();
      final paramsList = await paramRepo.getParamsForNom();
      final groupList = await groupRepo.getNomenclaturesGroupsShort();

      bool isEnd = NomenclaturesState.showCount >= countAll;
      emit(NomenclaturesListLoadedState(
        nomenclaturesList: nomenclaturesList,
        unitsList: unitsList,
        storeroomList: storeroomList,
        paramsList: paramsList,
        groupList: groupList,
        countAll: countAll,
        isEnd: isEnd,
        limit: NomenclaturesState.showCount,
      ));
    } catch (e, _) {
      emit(NomenclaturesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextNomenclaturesList(
    LoadNextNomenclaturesListEvent event,
    Emitter<NomenclaturesState> emit,
  ) async {
    try {
      if (state is! NomenclaturesListLoadedState) {
        emit(NomenclaturesListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + NomenclaturesState.showCount;
      final (nomenclaturesList, countAll) =
          await nomenclaturesRepo.getNomenclaturesList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as NomenclaturesListLoadedState).copyWith(
          nomenclaturesList: nomenclaturesList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(NomenclaturesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewNomenclatures(
    CreateNewNomenclaturesEvent event,
    Emitter<NomenclaturesState> emit,
  ) async {
    try {
      final Nomenclatures newNomenclatures =
          await nomenclaturesRepo.createNewNomenclatures(
        name: event.name!,
        description: event.description!,
        unit: event.unit!,
        storeroom: event.storeroom!,
      );

      emit((state as NomenclaturesListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          nomenclaturesList: [newNomenclatures, ...state.nomenclaturesList!]));
    } catch (e, _) {
      emit(NomenclaturesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editNomenclatures(
    EditNomenclaturesEvent event,
    Emitter<NomenclaturesState> emit,
  ) async {
    try {
      final Nomenclatures editedNomenclatures =
          await nomenclaturesRepo.editNomenclaturesRepo(
        id: event.id,
        name: event.name,
        unit: event.unit,
        storeroom: event.storeroom,
        description: event.description,
      );

      if (state is NomenclaturesListLoadedState ||
          state is NomenclaturesListLoadingState) {
        List<Nomenclatures> newList = [];
        for (Nomenclatures nomenclatures in state.nomenclaturesList!) {
          if (nomenclatures.id == editedNomenclatures.id) {
            newList.add(editedNomenclatures);
          } else {
            newList.add(nomenclatures);
          }
        }

        emit((state as NomenclaturesListLoadedState)
            .copyWith(nomenclaturesList: newList));
      }
      if (state is NomenclaturesDetailLoadedState ||
          state is NomenclaturesDetailLoadingState) {
        emit((state as NomenclaturesDetailLoadedState)
            .copyWith(nomenclatures: editedNomenclatures));
      }
    } catch (e, _) {
      emit(NomenclaturesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteNomenclatures(
    DeleteNomenclaturesEvent event,
    Emitter<NomenclaturesState> emit,
  ) async {
    try {
      await nomenclaturesRepo.deleteNomenclatures(
          id: event.id); //(nomenclaturesId: event.id)
      List<Nomenclatures> newList = [];
      for (Nomenclatures nomenclatures in state.nomenclaturesList!) {
        if (nomenclatures.id != event.id) {
          newList.add(nomenclatures);
        }
      }
      emit((state as NomenclaturesListLoadedState).copyWith(
          nomenclaturesList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(NomenclaturesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNomenclaturesDetail(
    LoadNomenclaturesDetailEvent event,
    Emitter<NomenclaturesState> emit,
  ) async {
    try {
      final nomenclatures =
          await nomenclaturesRepo.getNomenclaturesDetail(event.id);
      final unitsList = await unitsRepo.getUnitShort();
      final storeroomList = await stokRepo.getStoreroomShort();
      final paramsList = await paramRepo.getParamsForNom();
      final groupList = await groupRepo.getNomenclaturesGroupsShort();

      emit(NomenclaturesDetailLoadedState(
        nomenclatures: nomenclatures,
        unitsList: unitsList,
        storeroomList: storeroomList,
        paramsList: paramsList,
        groupList: groupList,
      ));
    } catch (e, _) {
      emit(NomenclaturesLoadingFailureState(exception: e));
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
