import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/type_of_work_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/models/type_of_work.dart';

part 'type_of_work_event.dart';
part 'type_of_work_state.dart';

class TypeWorkBloc extends Bloc<TypeWorkEvent, TypeWorkState> {
  TypeWorkBloc(
    this.typeWorkRepo,
  ) : super(TypeWorkInitialState()) {
    // ,this.taskRepo
    on<LoadTypeWorkListEvent>(_loadTypeWorkList);
    on<LoadNextTypeWorkListEvent>(_loadNextTypeWorkList);
    on<CreateNewTypeWorkEvent>(_createNewTypeWork);
    on<EditTypeWorkEvent>(_editTypeWork);
    on<DeleteTypeWorkEvent>(_deleteTypeWork);
    on<LoadTypeWorkDetailEvent>(_loadTypeWorkDetail);
  }

  final TypeWorkRepo typeWorkRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadTypeWorkList(
    LoadTypeWorkListEvent event,
    Emitter<TypeWorkState> emit,
  ) async {
    try {
      if (state is! TypeWorkListLoadedState) {
        emit(TypeWorkListLoadingState());
      }
      final (typeWorkList, countAll) = await typeWorkRepo.getTypeWorkList(
        page_size: TypeWorkState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = TypeWorkState.showCount >= countAll;
      emit(TypeWorkListLoadedState(
        typeWorkList: typeWorkList,
        countAll: countAll,
        isEnd: isEnd,
        limit: TypeWorkState.showCount,
      ));
    } catch (e, _) {
      emit(TypeWorkLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextTypeWorkList(
    LoadNextTypeWorkListEvent event,
    Emitter<TypeWorkState> emit,
  ) async {
    try {
      if (state is! TypeWorkListLoadedState) {
        emit(TypeWorkListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + TypeWorkState.showCount;
      final (typeWorkList, countAll) = await typeWorkRepo.getTypeWorkList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as TypeWorkListLoadedState).copyWith(
          typeWorkList: typeWorkList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(TypeWorkLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewTypeWork(
    CreateNewTypeWorkEvent event,
    Emitter<TypeWorkState> emit,
  ) async {
    try {
      final TypeWork newTypeWork = await typeWorkRepo.createNewTypeWork(
        name: event.name!,
        description: event.description!,
      );

      emit((state as TypeWorkListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          typeWorkList: [newTypeWork, ...state.typeWorkList!]));
    } catch (e, _) {
      emit(TypeWorkLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editTypeWork(
    EditTypeWorkEvent event,
    Emitter<TypeWorkState> emit,
  ) async {
    try {
      final TypeWork editedTypeWork = await typeWorkRepo.editTypeWorkRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is TypeWorkListLoadedState ||
          state is TypeWorkListLoadingState) {
        List<TypeWork> newList = [];
        for (TypeWork typeWork in state.typeWorkList!) {
          if (typeWork.id == editedTypeWork.id) {
            newList.add(editedTypeWork);
          } else {
            newList.add(typeWork);
          }
        }

        emit(
            (state as TypeWorkListLoadedState).copyWith(typeWorkList: newList));
      }
      if (state is TypeWorkDetailLoadedState ||
          state is TypeWorkDetailLoadingState) {
        emit((state as TypeWorkDetailLoadedState)
            .copyWith(typeWork: editedTypeWork));
      }
    } catch (e, _) {
      emit(TypeWorkLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteTypeWork(
    DeleteTypeWorkEvent event,
    Emitter<TypeWorkState> emit,
  ) async {
    try {
      await typeWorkRepo.deleteTypeWork(id: event.id); //(typeWorkId: event.id)
      List<TypeWork> newList = [];
      for (TypeWork typeWork in state.typeWorkList!) {
        if (typeWork.id != event.id) {
          newList.add(typeWork);
        }
      }
      emit((state as TypeWorkListLoadedState).copyWith(
          typeWorkList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(TypeWorkLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadTypeWorkDetail(
  //   LoadTypeWorkDetailEvent event,
  //   Emitter<TypeWorkState> emit,
  // ) async {
  //   try {
  //     final typeWork =
  //         await typeWorkRepo.getTypeWorkDetail(event.id);

  //     emit(TypeWorkDetailLoadedState(
  //       typeWork: typeWork,
  //     ));
  //   } catch (e, _) {
  //     emit(TypeWorkLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadTypeWorkDetail(
    LoadTypeWorkDetailEvent event,
    Emitter<TypeWorkState> emit,
  ) async {
    try {
      final typeWork = await typeWorkRepo.getTypeWorkDetail(event.id);

      emit(TypeWorkDetailLoadedState(
        typeWork: typeWork,
      ));
    } catch (e, _) {
      emit(TypeWorkLoadingFailureState(exception: e));
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
