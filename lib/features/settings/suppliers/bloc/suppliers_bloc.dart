import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/suppliers_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers.dart';

part 'suppliers_event.dart';
part 'suppliers_state.dart';

class SuppliersBloc extends Bloc<SuppliersEvent, SuppliersState> {
  SuppliersBloc(
    this.suppliersRepo,
  ) : super(SuppliersInitialState()) {
    // ,this.taskRepo
    on<LoadSuppliersListEvent>(_loadSuppliersList);
    on<LoadNextSuppliersListEvent>(_loadNextSuppliersList);
    on<CreateNewSuppliersEvent>(_createNewSuppliers);
    on<EditSuppliersEvent>(_editSuppliers);
    on<DeleteSuppliersEvent>(_deleteSuppliers);
    on<LoadSuppliersDetailEvent>(_loadSuppliersDetail);
  }

  final SuppliersRepo suppliersRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadSuppliersList(
    LoadSuppliersListEvent event,
    Emitter<SuppliersState> emit,
  ) async {
    try {
      if (state is! SuppliersListLoadedState) {
        emit(SuppliersListLoadingState());
      }
      final (suppliersList, countAll) = await suppliersRepo.getSuppliersList(
        page_size: SuppliersState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = SuppliersState.showCount >= countAll;
      emit(SuppliersListLoadedState(
        suppliersList: suppliersList,
        countAll: countAll,
        isEnd: isEnd,
        limit: SuppliersState.showCount,
      ));
    } catch (e, _) {
      emit(SuppliersLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextSuppliersList(
    LoadNextSuppliersListEvent event,
    Emitter<SuppliersState> emit,
  ) async {
    try {
      if (state is! SuppliersListLoadedState) {
        emit(SuppliersListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + SuppliersState.showCount;
      final (suppliersList, countAll) = await suppliersRepo.getSuppliersList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as SuppliersListLoadedState).copyWith(
          suppliersList: suppliersList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(SuppliersLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewSuppliers(
    CreateNewSuppliersEvent event,
    Emitter<SuppliersState> emit,
  ) async {
    try {
      final Suppliers newSuppliers = await suppliersRepo.createNewSuppliers(
        name: event.name!,
        description: event.description!,
      );

      emit((state as SuppliersListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          suppliersList: [newSuppliers, ...state.suppliersList!]));
    } catch (e, _) {
      emit(SuppliersLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editSuppliers(
    EditSuppliersEvent event,
    Emitter<SuppliersState> emit,
  ) async {
    try {
      final Suppliers editedSuppliers = await suppliersRepo.editSuppliersRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is SuppliersListLoadedState ||
          state is SuppliersListLoadingState) {
        List<Suppliers> newList = [];
        for (Suppliers suppliers in state.suppliersList!) {
          if (suppliers.id == editedSuppliers.id) {
            newList.add(editedSuppliers);
          } else {
            newList.add(suppliers);
          }
        }

        emit((state as SuppliersListLoadedState)
            .copyWith(suppliersList: newList));
      }
      if (state is SuppliersDetailLoadedState ||
          state is SuppliersDetailLoadingState) {
        emit((state as SuppliersDetailLoadedState)
            .copyWith(suppliers: editedSuppliers));
      }
    } catch (e, _) {
      emit(SuppliersLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteSuppliers(
    DeleteSuppliersEvent event,
    Emitter<SuppliersState> emit,
  ) async {
    try {
      await suppliersRepo.deleteSuppliers(
          id: event.id); //(suppliersId: event.id)
      List<Suppliers> newList = [];
      for (Suppliers suppliers in state.suppliersList!) {
        if (suppliers.id != event.id) {
          newList.add(suppliers);
        }
      }
      emit((state as SuppliersListLoadedState).copyWith(
          suppliersList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(SuppliersLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadSuppliersDetail(
  //   LoadSuppliersDetailEvent event,
  //   Emitter<SuppliersState> emit,
  // ) async {
  //   try {
  //     final suppliers =
  //         await suppliersRepo.getSuppliersDetail(event.id);

  //     emit(SuppliersDetailLoadedState(
  //       suppliers: suppliers,
  //     ));
  //   } catch (e, _) {
  //     emit(SuppliersLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadSuppliersDetail(
    LoadSuppliersDetailEvent event,
    Emitter<SuppliersState> emit,
  ) async {
    try {
      final suppliers = await suppliersRepo.getSuppliersDetail(event.id);

      emit(SuppliersDetailLoadedState(
        suppliers: suppliers,
      ));
    } catch (e, _) {
      emit(SuppliersLoadingFailureState(exception: e));
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
