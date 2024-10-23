import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/type_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/models/type_of_ops.dart';

part 'type_of_ops_event.dart';
part 'type_of_ops_state.dart';

class TypeOpsBloc extends Bloc<TypeOpsEvent, TypeOpsState> {
  TypeOpsBloc(
    this.typeOpsRepo,
  ) : super(TypeOpsInitialState()) {
    // ,this.taskRepo
    on<LoadTypeOpsListEvent>(_loadTypeOpsList);
    on<LoadNextTypeOpsListEvent>(_loadNextTypeOpsList);
    on<CreateNewTypeOpsEvent>(_createNewTypeOps);
    on<EditTypeOpsEvent>(_editTypeOps);
    on<DeleteTypeOpsEvent>(_deleteTypeOps);
    on<LoadTypeOpsDetailEvent>(_loadTypeOpsDetail);
  }

  final TypeOpsRepo typeOpsRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadTypeOpsList(
    LoadTypeOpsListEvent event,
    Emitter<TypeOpsState> emit,
  ) async {
    try {
      if (state is! TypeOpsListLoadedState) {
        emit(TypeOpsListLoadingState());
      }
      final (typeOpsList, countAll) = await typeOpsRepo.getTypeOpsList(
        page_size: TypeOpsState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = TypeOpsState.showCount >= countAll;
      emit(TypeOpsListLoadedState(
        typeOpsList: typeOpsList,
        countAll: countAll,
        isEnd: isEnd,
        limit: TypeOpsState.showCount,
      ));
    } catch (e, _) {
      emit(TypeOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextTypeOpsList(
    LoadNextTypeOpsListEvent event,
    Emitter<TypeOpsState> emit,
  ) async {
    try {
      if (state is! TypeOpsListLoadedState) {
        emit(TypeOpsListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + TypeOpsState.showCount;
      final (typeOpsList, countAll) = await typeOpsRepo.getTypeOpsList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as TypeOpsListLoadedState).copyWith(
          typeOpsList: typeOpsList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(TypeOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewTypeOps(
    CreateNewTypeOpsEvent event,
    Emitter<TypeOpsState> emit,
  ) async {
    try {
      final TypeOps newTypeOps = await typeOpsRepo.createNewTypeOps(
        name: event.name!,
        description: event.description!,
      );

      emit((state as TypeOpsListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          typeOpsList: [newTypeOps, ...state.typeOpsList!]));
    } catch (e, _) {
      emit(TypeOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editTypeOps(
    EditTypeOpsEvent event,
    Emitter<TypeOpsState> emit,
  ) async {
    try {
      final TypeOps editedTypeOps = await typeOpsRepo.editTypeOpsRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is TypeOpsListLoadedState || state is TypeOpsListLoadingState) {
        List<TypeOps> newList = [];
        for (TypeOps typeOps in state.typeOpsList!) {
          if (typeOps.id == editedTypeOps.id) {
            newList.add(editedTypeOps);
          } else {
            newList.add(typeOps);
          }
        }

        emit((state as TypeOpsListLoadedState).copyWith(typeOpsList: newList));
      }
      if (state is TypeOpsDetailLoadedState ||
          state is TypeOpsDetailLoadingState) {
        emit((state as TypeOpsDetailLoadedState)
            .copyWith(typeOps: editedTypeOps));
      }
    } catch (e, _) {
      emit(TypeOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteTypeOps(
    DeleteTypeOpsEvent event,
    Emitter<TypeOpsState> emit,
  ) async {
    try {
      await typeOpsRepo.deleteTypeOps(id: event.id); //(typeOpsId: event.id)
      List<TypeOps> newList = [];
      for (TypeOps typeOps in state.typeOpsList!) {
        if (typeOps.id != event.id) {
          newList.add(typeOps);
        }
      }
      emit((state as TypeOpsListLoadedState).copyWith(
          typeOpsList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(TypeOpsLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadTypeOpsDetail(
  //   LoadTypeOpsDetailEvent event,
  //   Emitter<TypeOpsState> emit,
  // ) async {
  //   try {
  //     final typeOps =
  //         await typeOpsRepo.getTypeOpsDetail(event.id);

  //     emit(TypeOpsDetailLoadedState(
  //       typeOps: typeOps,
  //     ));
  //   } catch (e, _) {
  //     emit(TypeOpsLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadTypeOpsDetail(
    LoadTypeOpsDetailEvent event,
    Emitter<TypeOpsState> emit,
  ) async {
    try {
      final typeOps = await typeOpsRepo.getTypeOpsDetail(event.id);

      emit(TypeOpsDetailLoadedState(
        typeOps: typeOps,
      ));
    } catch (e, _) {
      emit(TypeOpsLoadingFailureState(exception: e));
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
