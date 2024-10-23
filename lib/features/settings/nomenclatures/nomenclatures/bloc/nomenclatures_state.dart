part of 'nomenclatures_bloc.dart';

class NomenclaturesState extends Equatable {
  static const int showCount = 20;

  const NomenclaturesState({
    this.nomenclaturesList,
    this.unitsList,
    this.storeroomList,
    this.paramsList,
    this.groupList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.nomenclatures, // Добавлено поле для организации
  });

  final List<Nomenclatures>? nomenclaturesList;
  final List<UnitShort>? unitsList;
  final List<StoreroomShort>? storeroomList;
  final List<NomenclaturesParametrs>? paramsList;
  final List<NomenclaturesGroupShort>? groupList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Nomenclatures? nomenclatures; // Новое поле для организации

  @override
  List<Object?> get props => [
        nomenclaturesList,
        unitsList,
        storeroomList,
        paramsList, groupList,
        countAll,
        limit,
        isEnd,
        nomenclatures, // Добавляем nomenclatures в props
      ];
}

class NomenclaturesInitialState extends NomenclaturesState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesListLoadingState extends NomenclaturesState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesListLoadedState extends NomenclaturesState {
  const NomenclaturesListLoadedState({
    required super.nomenclaturesList,
    required super.unitsList,
    required super.storeroomList,
    required super.paramsList,
    required super.groupList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  NomenclaturesListLoadedState copyWith({
    List<Nomenclatures>? nomenclaturesList,
    List<UnitShort>? unitsList,
    List<StoreroomShort>? storeroomList,
    List<NomenclaturesParametrs>? paramsList,
    final List<NomenclaturesGroupShort>? groupList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return NomenclaturesListLoadedState(
      nomenclaturesList: nomenclaturesList ?? this.nomenclaturesList,
      unitsList: unitsList ?? this.unitsList,
      storeroomList: storeroomList ?? this.storeroomList,
      paramsList: paramsList ?? this.paramsList,
      groupList: groupList ?? this.groupList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [nomenclaturesList, countAll, limit, isEnd];
}

class NomenclaturesLoadingFailureState extends NomenclaturesState {
  const NomenclaturesLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class NomenclaturesDetailLoadingState extends NomenclaturesState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesDetailLoadedState extends NomenclaturesState {
  const NomenclaturesDetailLoadedState({
    required super.nomenclatures,
    required super.unitsList,
    required super.storeroomList,
    required super.paramsList,
    required super.groupList,
  });

  @override
  List<Object?> get props => [nomenclatures];

  NomenclaturesDetailLoadedState copyWith({
    Nomenclatures? nomenclatures,
  }) {
    return NomenclaturesDetailLoadedState(
      nomenclatures: nomenclatures ?? this.nomenclatures,
      unitsList: unitsList ?? unitsList,
      storeroomList: storeroomList ?? storeroomList,
      paramsList: paramsList ?? paramsList,
      groupList: groupList ?? groupList,
    );
  }
}
