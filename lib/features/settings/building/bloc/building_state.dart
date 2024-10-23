part of 'building_bloc.dart';

class BuildingState extends Equatable {
  static const int showCount = 20;

  const BuildingState({
    this.buildingList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.building, // Добавлено поле для организации
  });

  final List<Building>? buildingList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Building? building; // Новое поле для организации

  @override
  List<Object?> get props => [
        buildingList,
        countAll,
        limit,
        isEnd,
        building, // Добавляем building в props
      ];
}

class BuildingInitialState extends BuildingState {
  @override
  List<Object?> get props => [];
}

class BuildingListLoadingState extends BuildingState {
  @override
  List<Object?> get props => [];
}

class BuildingListLoadedState extends BuildingState {
  const BuildingListLoadedState({
    required super.buildingList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  BuildingListLoadedState copyWith({
    List<Building>? buildingList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return BuildingListLoadedState(
      buildingList: buildingList ?? this.buildingList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [buildingList, countAll, limit, isEnd];
}

class BuildingLoadingFailureState extends BuildingState {
  const BuildingLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class BuildingDetailLoadingState extends BuildingState {
  @override
  List<Object?> get props => [];
}

class BuildingDetailLoadedState extends BuildingState {
  const BuildingDetailLoadedState({
    required super.building,
  });

  @override
  List<Object?> get props => [building];

  BuildingDetailLoadedState copyWith({
    Building? building,
  }) {
    return BuildingDetailLoadedState(
      building: building ?? this.building,
    );
  }
}
