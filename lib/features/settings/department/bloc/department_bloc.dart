import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc(
    this.departmentRepo,
  ) : super(DepartmentInitialState()) {
    // ,this.taskRepo
    on<LoadDepartmentListEvent>(_loadDepartmentList);
    on<LoadNextDepartmentListEvent>(_loadNextDepartmentList);
    on<CreateNewDepartmentEvent>(_createNewDepartment);
    on<EditDepartmentEvent>(_editDepartment);
    on<DeleteDepartmentEvent>(_deleteDepartment);
    on<LoadDepartmentDetailEvent>(_loadDepartmentDetail);
  }

  final DepartmentRepo departmentRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadDepartmentList(
    LoadDepartmentListEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    try {
      if (state is! DepartmentListLoadedState) {
        emit(DepartmentListLoadingState());
      }
      final (departmentList, countAll) = await departmentRepo.getDepartmentList(
        page_size: DepartmentState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = DepartmentState.showCount >= countAll;
      emit(DepartmentListLoadedState(
        departmentList: departmentList,
        countAll: countAll,
        isEnd: isEnd,
        limit: DepartmentState.showCount,
      ));
    } catch (e, _) {
      emit(DepartmentLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextDepartmentList(
    LoadNextDepartmentListEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    try {
      if (state is! DepartmentListLoadedState) {
        emit(DepartmentListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + DepartmentState.showCount;
      final (departmentList, countAll) = await departmentRepo.getDepartmentList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as DepartmentListLoadedState).copyWith(
          departmentList: departmentList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(DepartmentLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewDepartment(
    CreateNewDepartmentEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    try {
      final Department newDepartment = await departmentRepo.createNewDepartment(
        name: event.name!,
        description: event.description!,
      );

      emit((state as DepartmentListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          departmentList: [newDepartment, ...state.departmentList!]));
    } catch (e, _) {
      emit(DepartmentLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editDepartment(
    EditDepartmentEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    try {
      final Department editedDepartment =
          await departmentRepo.editDepartmentRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is DepartmentListLoadedState ||
          state is DepartmentListLoadingState) {
        List<Department> newList = [];
        for (Department department in state.departmentList!) {
          if (department.id == editedDepartment.id) {
            newList.add(editedDepartment);
          } else {
            newList.add(department);
          }
        }

        emit((state as DepartmentListLoadedState)
            .copyWith(departmentList: newList));
      }
      if (state is DepartmentDetailLoadedState ||
          state is DepartmentDetailLoadingState) {
        emit((state as DepartmentDetailLoadedState)
            .copyWith(department: editedDepartment));
      }
    } catch (e, _) {
      emit(DepartmentLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteDepartment(
    DeleteDepartmentEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    try {
      await departmentRepo.deleteDepartment(
          id: event.id); //(departmentId: event.id)
      List<Department> newList = [];
      for (Department department in state.departmentList!) {
        if (department.id != event.id) {
          newList.add(department);
        }
      }
      emit((state as DepartmentListLoadedState).copyWith(
          departmentList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(DepartmentLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadDepartmentDetail(
  //   LoadDepartmentDetailEvent event,
  //   Emitter<DepartmentState> emit,
  // ) async {
  //   try {
  //     final department =
  //         await departmentRepo.getDepartmentDetail(event.id);

  //     emit(DepartmentDetailLoadedState(
  //       department: department,
  //     ));
  //   } catch (e, _) {
  //     emit(DepartmentLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadDepartmentDetail(
    LoadDepartmentDetailEvent event,
    Emitter<DepartmentState> emit,
  ) async {
    try {
      final department = await departmentRepo.getDepartmentDetail(event.id);

      emit(DepartmentDetailLoadedState(
        department: department,
      ));
    } catch (e, _) {
      emit(DepartmentLoadingFailureState(exception: e));
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
