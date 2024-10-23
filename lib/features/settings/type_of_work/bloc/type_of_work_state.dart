part of 'type_of_work_bloc.dart';

class TypeWorkState extends Equatable {
  static const int showCount = 20;

  const TypeWorkState({
    this.typeWorkList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.typeWork, // Добавлено поле для организации
  });

  final List<TypeWork>? typeWorkList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final TypeWork? typeWork; // Новое поле для организации

  @override
  List<Object?> get props => [
        typeWorkList,
        countAll,
        limit,
        isEnd,
        typeWork, // Добавляем typeWork в props
      ];
}

class TypeWorkInitialState extends TypeWorkState {
  @override
  List<Object?> get props => [];
}

class TypeWorkListLoadingState extends TypeWorkState {
  @override
  List<Object?> get props => [];
}

class TypeWorkListLoadedState extends TypeWorkState {
  const TypeWorkListLoadedState({
    required super.typeWorkList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  TypeWorkListLoadedState copyWith({
    List<TypeWork>? typeWorkList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return TypeWorkListLoadedState(
      typeWorkList: typeWorkList ?? this.typeWorkList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [typeWorkList, countAll, limit, isEnd];
}

class TypeWorkLoadingFailureState extends TypeWorkState {
  const TypeWorkLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class TypeWorkDetailLoadingState extends TypeWorkState {
  @override
  List<Object?> get props => [];
}

class TypeWorkDetailLoadedState extends TypeWorkState {
  const TypeWorkDetailLoadedState({
    required super.typeWork,
  });

  @override
  List<Object?> get props => [typeWork];

  TypeWorkDetailLoadedState copyWith({
    TypeWork? typeWork,
  }) {
    return TypeWorkDetailLoadedState(
      typeWork: typeWork ?? this.typeWork,
    );
  }
}
