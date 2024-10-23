part of 'accounting_bloc.dart';

class AccountingState extends Equatable {
  static const int showCount = 20;

  const AccountingState({
    this.accountingList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.accounting, // Добавлено поле для организации
  });

  final List<Accounting>? accountingList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Accounting? accounting; // Новое поле для организации

  @override
  List<Object?> get props => [
        accountingList,
        countAll,
        limit,
        isEnd,
        accounting, // Добавляем accounting в props
      ];
}

class AccountingInitialState extends AccountingState {
  @override
  List<Object?> get props => [];
}

class AccountingListLoadingState extends AccountingState {
  @override
  List<Object?> get props => [];
}

class AccountingListLoadedState extends AccountingState {
  const AccountingListLoadedState({
    required super.accountingList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  AccountingListLoadedState copyWith({
    List<Accounting>? accountingList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return AccountingListLoadedState(
      accountingList: accountingList ?? this.accountingList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [accountingList, countAll, limit, isEnd];
}

class AccountingLoadingFailureState extends AccountingState {
  const AccountingLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class AccountingDetailLoadingState extends AccountingState {
  @override
  List<Object?> get props => [];
}

class AccountingDetailLoadedState extends AccountingState {
  const AccountingDetailLoadedState({
    required super.accounting,
  });

  @override
  List<Object?> get props => [accounting];

  AccountingDetailLoadedState copyWith({
    Accounting? accounting,
  }) {
    return AccountingDetailLoadedState(
      accounting: accounting ?? this.accounting,
    );
  }
}
