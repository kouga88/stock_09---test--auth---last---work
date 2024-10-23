part of 'directions_of_ops_bloc.dart';

class DirectionsOpsState extends Equatable {
  static const int showCount = 20;

  const DirectionsOpsState({
    this.directionsOpsList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.directionsOps, // Добавлено поле для организации
  });

  final List<DirectionsOps>? directionsOpsList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final DirectionsOps? directionsOps; // Новое поле для организации

  @override
  List<Object?> get props => [
        directionsOpsList,
        countAll,
        limit,
        isEnd,
        directionsOps, // Добавляем directionsOps в props
      ];
}

class DirectionsOpsInitialState extends DirectionsOpsState {
  @override
  List<Object?> get props => [];
}

class DirectionsOpsListLoadingState extends DirectionsOpsState {
  @override
  List<Object?> get props => [];
}

class DirectionsOpsListLoadedState extends DirectionsOpsState {
  const DirectionsOpsListLoadedState({
    required super.directionsOpsList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  DirectionsOpsListLoadedState copyWith({
    List<DirectionsOps>? directionsOpsList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return DirectionsOpsListLoadedState(
      directionsOpsList: directionsOpsList ?? this.directionsOpsList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [directionsOpsList, countAll, limit, isEnd];
}

class DirectionsOpsLoadingFailureState extends DirectionsOpsState {
  const DirectionsOpsLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class DirectionsOpsDetailLoadingState extends DirectionsOpsState {
  @override
  List<Object?> get props => [];
}

class DirectionsOpsDetailLoadedState extends DirectionsOpsState {
  const DirectionsOpsDetailLoadedState({
    required super.directionsOps,
  });

  @override
  List<Object?> get props => [directionsOps];

  DirectionsOpsDetailLoadedState copyWith({
    DirectionsOps? directionsOps,
  }) {
    return DirectionsOpsDetailLoadedState(
      directionsOps: directionsOps ?? this.directionsOps,
    );
  }
}
