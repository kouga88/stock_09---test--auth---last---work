import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/reserves_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';
part 'reserves_event.dart';
part 'reserves_state.dart';

class ReservesBloc extends Bloc<ReservesEvent, ReservesState> {
  ReservesBloc(this.reservesRepo, this.storeroomRepo)
      : super(ReservesInitialState()) {
    // ,this.taskRepo
    on<LoadReservesListEvent>(_loadReservesList);
    on<LoadNextReservesListEvent>(_loadNextReservesList);
    on<CreateNewReservesEvent>(_createNewReserves);
    on<EditReservesEvent>(_editReserves);
    on<DeleteReservesEvent>(_deleteReserves);
    on<LoadReservesDetailEvent>(_loadReservesDetail);
  }

  final ReservesRepo reservesRepo;
  final StoreroomRepo storeroomRepo;

  Future<void> _loadReservesList(
    LoadReservesListEvent event,
    Emitter<ReservesState> emit,
  ) async {
    try {
      if (state is! ReservesListLoadedState) {
        emit(ReservesListLoadingState());
      }

      final (reservesList, countAll) = await reservesRepo.getReservesList(
        page_size: ReservesState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      final storeroomList = await storeroomRepo.getStoreroomShort();
      bool isEnd = ReservesState.showCount >= countAll;
      emit(ReservesListLoadedState(
        reservesList: reservesList,
        storeroomList: storeroomList,
        countAll: countAll,
        isEnd: isEnd,
        limit: ReservesState.showCount,
      ));
    } catch (e, _) {
      emit(ReservesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextReservesList(
    LoadNextReservesListEvent event,
    Emitter<ReservesState> emit,
  ) async {
    try {
      if (state is! ReservesListLoadedState) {
        emit(ReservesListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + ReservesState.showCount;
      final (reservesList, countAll) = await reservesRepo.getReservesList(
        page_size: newLimit,
        page: 1,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as ReservesListLoadedState).copyWith(
          reservesList: reservesList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(ReservesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewReserves(
    CreateNewReservesEvent event,
    Emitter<ReservesState> emit,
  ) async {
    try {
      final Reserves newReserves = await reservesRepo.createNewReserves(
        name: event.name,
        description: event.description,
        storeroom: event.storeroom!,
        status: event.status,
      );

      emit((state as ReservesListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          reservesList: [newReserves, ...state.reservesList!]));
    } catch (e, _) {
      emit(ReservesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editReserves(
    EditReservesEvent event,
    Emitter<ReservesState> emit,
  ) async {
    try {
      final Reserves editedReserves = await reservesRepo.editReserves(
        id: event.id,
        name: event.name,
        description: event.description,
        storeroom: event.storeroom,
        status: event.status,
      );

      if (state is ReservesListLoadedState ||
          state is ReservesListLoadingState) {
        List<Reserves> newList = [];
        for (Reserves storeroom in state.reservesList!) {
          if (storeroom.id == editedReserves.id) {
            newList.add(editedReserves);
          } else {
            newList.add(storeroom);
          }
        }
        emit(
            (state as ReservesListLoadedState).copyWith(reservesList: newList));
      }
      if (state is ReservesDetailLoadedState ||
          state is ReservesDetailLoadingState) {
        emit((state as ReservesDetailLoadedState)
            .copyWith(reserves: editedReserves));
      }
    } catch (e, _) {
      emit(ReservesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _deleteReserves(
    DeleteReservesEvent event,
    Emitter<ReservesState> emit,
  ) async {
    try {
      await reservesRepo.deleteReserves(id: event.id); //(storeroomId: event.id)
      List<Reserves> newList = [];
      for (Reserves storeroom in state.reservesList!) {
        if (storeroom.id != event.id) {
          newList.add(storeroom);
        }
      }
      emit((state as ReservesListLoadedState).copyWith(
          reservesList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(ReservesLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //
  Future<void> _loadReservesDetail(
    LoadReservesDetailEvent event,
    Emitter<ReservesState> emit,
  ) async {
    try {
      final reserves = await reservesRepo.getReservesDetail(event.id);
      final storeroomList = await storeroomRepo.getStoreroomShort();

      emit(ReservesDetailLoadedState(
        reserves: reserves,
        storeroomList: storeroomList,
      )); //, projectList: projectList
    } catch (e, _) {
      emit(ReservesLoadingFailureState(exception: e));
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
