part of 'type_of_ops_bloc.dart';

class TypeOpsState extends Equatable {
  static const int showCount = 20;

  const TypeOpsState({
    this.typeOpsList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.typeOps, // Добавлено поле для организации
  });

  final List<TypeOps>? typeOpsList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final TypeOps? typeOps; // Новое поле для организации

  @override
  List<Object?> get props => [
        typeOpsList,
        countAll,
        limit,
        isEnd,
        typeOps, // Добавляем typeOps в props
      ];
}

class TypeOpsInitialState extends TypeOpsState {
  @override
  List<Object?> get props => [];
}

class TypeOpsListLoadingState extends TypeOpsState {
  @override
  List<Object?> get props => [];
}

class TypeOpsListLoadedState extends TypeOpsState {
  const TypeOpsListLoadedState({
    required super.typeOpsList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  TypeOpsListLoadedState copyWith({
    List<TypeOps>? typeOpsList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return TypeOpsListLoadedState(
      typeOpsList: typeOpsList ?? this.typeOpsList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [typeOpsList, countAll, limit, isEnd];
}

class TypeOpsLoadingFailureState extends TypeOpsState {
  const TypeOpsLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class TypeOpsDetailLoadingState extends TypeOpsState {
  @override
  List<Object?> get props => [];
}

class TypeOpsDetailLoadedState extends TypeOpsState {
  const TypeOpsDetailLoadedState({
    required super.typeOps,
  });

  @override
  List<Object?> get props => [typeOps];

  TypeOpsDetailLoadedState copyWith({
    TypeOps? typeOps,
  }) {
    return TypeOpsDetailLoadedState(
      typeOps: typeOps ?? this.typeOps,
    );
  }
}
