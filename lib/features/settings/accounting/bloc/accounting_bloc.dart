import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/models/accounting.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/accounting_repo.dart';

part 'accounting_event.dart';
part 'accounting_state.dart';

class AccountingBloc extends Bloc<AccountingEvent, AccountingState> {
  AccountingBloc(
    this.accountingRepo,
  ) : super(AccountingInitialState()) {
    // ,this.taskRepo
    on<LoadAccountingListEvent>(_loadAccountingList);
    on<LoadNextAccountingListEvent>(_loadNextAccountingList);
    on<CreateNewAccountingEvent>(_createNewAccounting);
    on<EditAccountingEvent>(_editAccounting);
    on<DeleteAccountingEvent>(_deleteAccounting);
    on<LoadAccountingDetailEvent>(_loadAccountingDetail);
  }

  final AccountingRepo accountingRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadAccountingList(
    LoadAccountingListEvent event,
    Emitter<AccountingState> emit,
  ) async {
    try {
      if (state is! AccountingListLoadedState) {
        emit(AccountingListLoadingState());
      }
      final (accountingList, countAll) = await accountingRepo.getAccountingList(
        page_size: AccountingState.showCount,
        page: 1,
        searchText: event.searchText,
      );

      bool isEnd = AccountingState.showCount >= countAll;
      emit(AccountingListLoadedState(
        accountingList: accountingList,
        countAll: countAll,
        isEnd: isEnd,
        limit: AccountingState.showCount,
      ));
    } catch (e, _) {
      emit(AccountingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextAccountingList(
    LoadNextAccountingListEvent event,
    Emitter<AccountingState> emit,
  ) async {
    try {
      if (state is! AccountingListLoadedState) {
        emit(AccountingListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + AccountingState.showCount;
      final (accountingList, countAll) = await accountingRepo.getAccountingList(
        page_size: newLimit,
        page: 1,
        searchText: event.searchText,
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as AccountingListLoadedState).copyWith(
          accountingList: accountingList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(AccountingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewAccounting(
    CreateNewAccountingEvent event,
    Emitter<AccountingState> emit,
  ) async {
    try {
      final Accounting newAccounting = await accountingRepo.createNewAccounting(
        name: event.name!,
        number: event.number!,
      );

      emit((state as AccountingListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          accountingList: [newAccounting, ...state.accountingList!]));
    } catch (e, _) {
      emit(AccountingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editAccounting(
    EditAccountingEvent event,
    Emitter<AccountingState> emit,
  ) async {
    try {
      final Accounting editedAccounting =
          await accountingRepo.editAccountingRepo(
        id: event.id,
        name: event.name,
        number: event.number,
      );

      if (state is AccountingListLoadedState ||
          state is AccountingListLoadingState) {
        List<Accounting> newList = [];
        for (Accounting accounting in state.accountingList!) {
          if (accounting.id == editedAccounting.id) {
            newList.add(editedAccounting);
          } else {
            newList.add(accounting);
          }
        }

        emit((state as AccountingListLoadedState)
            .copyWith(accountingList: newList));
      }
      if (state is AccountingDetailLoadedState ||
          state is AccountingDetailLoadingState) {
        emit((state as AccountingDetailLoadedState)
            .copyWith(accounting: editedAccounting));
      }
    } catch (e, _) {
      emit(AccountingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteAccounting(
    DeleteAccountingEvent event,
    Emitter<AccountingState> emit,
  ) async {
    try {
      await accountingRepo.deleteAccounting(
          id: event.id); //(accountingId: event.id)
      List<Accounting> newList = [];
      for (Accounting accounting in state.accountingList!) {
        if (accounting.id != event.id) {
          newList.add(accounting);
        }
      }
      emit((state as AccountingListLoadedState).copyWith(
          accountingList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(AccountingLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadAccountingDetail(
  //   LoadAccountingDetailEvent event,
  //   Emitter<AccountingState> emit,
  // ) async {
  //   try {
  //     final accounting =
  //         await accountingRepo.getAccountingDetail(event.id);

  //     emit(AccountingDetailLoadedState(
  //       accounting: accounting,
  //     ));
  //   } catch (e, _) {
  //     emit(AccountingLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadAccountingDetail(
    LoadAccountingDetailEvent event,
    Emitter<AccountingState> emit,
  ) async {
    try {
      final accounting = await accountingRepo.getAccountingDetail(event.id);

      emit(AccountingDetailLoadedState(
        accounting: accounting,
      ));
    } catch (e, _) {
      emit(AccountingLoadingFailureState(exception: e));
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
