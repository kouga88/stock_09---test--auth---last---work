part of 'mission_of_ops_bloc.dart';

class MissionOperationsState extends Equatable {
  static const int showCount = 20;

  const MissionOperationsState({
    this.missionOperationsList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.missionOperations, // Добавлено поле для организации
  });

  final List<MissionOperations>? missionOperationsList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final MissionOperations? missionOperations; // Новое поле для организации

  @override
  List<Object?> get props => [
        missionOperationsList,
        countAll,
        limit,
        isEnd,
        missionOperations, // Добавляем missionOperations в props
      ];
}

class MissionOperationsInitialState extends MissionOperationsState {
  @override
  List<Object?> get props => [];
}

class MissionOperationsListLoadingState extends MissionOperationsState {
  @override
  List<Object?> get props => [];
}

class MissionOperationsListLoadedState extends MissionOperationsState {
  const MissionOperationsListLoadedState({
    required super.missionOperationsList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  MissionOperationsListLoadedState copyWith({
    List<MissionOperations>? missionOperationsList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return MissionOperationsListLoadedState(
      missionOperationsList:
          missionOperationsList ?? this.missionOperationsList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [missionOperationsList, countAll, limit, isEnd];
}

class MissionOperationsLoadingFailureState extends MissionOperationsState {
  const MissionOperationsLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class MissionOperationsDetailLoadingState extends MissionOperationsState {
  @override
  List<Object?> get props => [];
}

class MissionOperationsDetailLoadedState extends MissionOperationsState {
  const MissionOperationsDetailLoadedState({
    required super.missionOperations,
  });

  @override
  List<Object?> get props => [missionOperations];

  MissionOperationsDetailLoadedState copyWith({
    MissionOperations? missionOperations,
  }) {
    return MissionOperationsDetailLoadedState(
      missionOperations: missionOperations ?? this.missionOperations,
    );
  }
}
