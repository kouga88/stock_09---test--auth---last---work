part of 'units_bloc.dart';

class UnitsState extends Equatable {
  static const int showCount = 20;

  const UnitsState({
    this.unitsList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.units, // Добавлено поле для организации
  });

  final List<Units>? unitsList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Units? units; // Новое поле для организации

  @override
  List<Object?> get props => [
        unitsList,
        countAll,
        limit,
        isEnd,
        units, // Добавляем units в props
      ];
}

class UnitsInitialState extends UnitsState {
  @override
  List<Object?> get props => [];
}

class UnitsListLoadingState extends UnitsState {
  @override
  List<Object?> get props => [];
}

class UnitsListLoadedState extends UnitsState {
  const UnitsListLoadedState({
    required super.unitsList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  UnitsListLoadedState copyWith({
    List<Units>? unitsList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return UnitsListLoadedState(
      unitsList: unitsList ?? this.unitsList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [unitsList, countAll, limit, isEnd];
}

class UnitsLoadingFailureState extends UnitsState {
  const UnitsLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class UnitsDetailLoadingState extends UnitsState {
  @override
  List<Object?> get props => [];
}

class UnitsDetailLoadedState extends UnitsState {
  const UnitsDetailLoadedState({
    required super.units,
  });

  @override
  List<Object?> get props => [units];

  UnitsDetailLoadedState copyWith({
    Units? units,
  }) {
    return UnitsDetailLoadedState(
      units: units ?? this.units,
    );
  }
}
