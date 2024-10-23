part of 'reserves_bloc.dart';

class ReservesState extends Equatable {
  static const int showCount = 20;

  const ReservesState({
    this.reservesList,
    this.storeroomList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.reserves,
  });

  final List<Reserves>? reservesList;

  final List<StoreroomShort>? storeroomList;

  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Reserves? reserves;

  @override
  List<Object?> get props => [
        reservesList,
        countAll,
        limit,
        isEnd,
        reserves,
        reservesList,
      ];
}

class ReservesInitialState extends ReservesState {
  @override
  List<Object?> get props => [];
}

class ReservesListLoadingState extends ReservesState {
  @override
  List<Object?> get props => [];
}

class ReservesListLoadedState extends ReservesState {
  const ReservesListLoadedState({
    required super.reservesList,
    required super.storeroomList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  ReservesListLoadedState copyWith({
    List<Reserves>? reservesList,
    List<StoreroomShort>? storeroomList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return ReservesListLoadedState(
      reservesList: reservesList ?? this.reservesList,
      storeroomList: storeroomList ?? this.storeroomList,
      countAll: countAll ?? this.countAll,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props =>
      [reservesList, reservesList, countAll, limit, isEnd];
}

class ReservesLoadingFailureState extends ReservesState {
  const ReservesLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class ReservesDetailLoadingState extends ReservesState {
  @override
  List<Object?> get props => [];
}

class ReservesDetailLoadedState extends ReservesState {
  const ReservesDetailLoadedState({
    required super.reserves,
    required super.storeroomList,
  });

  @override
  List<Object?> get props => [reserves]; // ,groupList, projectList

  ReservesDetailLoadedState copyWith({
    Reserves? reserves,
    List<StoreroomShort>? storeroomList,
  }) {
    return ReservesDetailLoadedState(
      reserves: reserves ?? this.reserves,
      storeroomList: storeroomList ?? this.storeroomList,
    );
  }
}
