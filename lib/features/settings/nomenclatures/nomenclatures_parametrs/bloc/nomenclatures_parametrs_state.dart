part of 'nomenclatures_parametrs_bloc.dart';

class NomenclaturesParametrsState extends Equatable {
  static const int showCount = 20;

  const NomenclaturesParametrsState({
    this.paramsNomList,
    this.unitsList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.paramsNom,
  });

  final List<NomenclaturesParametrs>? paramsNomList;
  final List<UnitShort>? unitsList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final NomenclaturesParametrs? paramsNom;

  @override
  List<Object?> get props => [
        paramsNomList,
        countAll,
        limit,
        isEnd,
        paramsNom,
        paramsNomList,
      ];
}

class NomenclaturesParametrsInitialState extends NomenclaturesParametrsState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesParametrsListLoadingState
    extends NomenclaturesParametrsState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesParametrsListLoadedState
    extends NomenclaturesParametrsState {
  const NomenclaturesParametrsListLoadedState({
    required super.paramsNomList,
    required super.unitsList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  NomenclaturesParametrsListLoadedState copyWith({
    List<NomenclaturesParametrs>? paramsNomList,
    List<UnitShort>? unitsList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return NomenclaturesParametrsListLoadedState(
      paramsNomList: paramsNomList ?? this.paramsNomList,
      unitsList: unitsList ?? this.unitsList,
      countAll: countAll ?? this.countAll,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props =>
      [paramsNomList, paramsNomList, countAll, limit, isEnd];
}

class NomenclaturesParametrsLoadingFailureState
    extends NomenclaturesParametrsState {
  const NomenclaturesParametrsLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class NomenclaturesParametrsDetailLoadingState
    extends NomenclaturesParametrsState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesParametrsDetailLoadedState
    extends NomenclaturesParametrsState {
  const NomenclaturesParametrsDetailLoadedState({
    required super.paramsNom,
    required super.unitsList,
  });

  @override
  List<Object?> get props => [paramsNom]; // ,groupList, projectList

  NomenclaturesParametrsDetailLoadedState copyWith({
    NomenclaturesParametrs? paramsNom,
    List<UnitShort>? unitsList,
  }) {
    return NomenclaturesParametrsDetailLoadedState(
      paramsNom: paramsNom ?? this.paramsNom,
      unitsList: unitsList ?? this.unitsList,
    );
  }
}
