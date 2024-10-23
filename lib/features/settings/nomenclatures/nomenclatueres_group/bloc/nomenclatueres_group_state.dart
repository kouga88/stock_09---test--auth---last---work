part of 'nomenclatueres_group_bloc.dart';

class NomenclaturesGroupState extends Equatable {
  static const int showCount = 20;

  const NomenclaturesGroupState({
    this.nomenclaturesGroupList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.nomenclaturesGroup, // Добавлено поле для организации
  });

  final List<NomenclaturesGroup>? nomenclaturesGroupList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final NomenclaturesGroup? nomenclaturesGroup; // Новое поле для организации

  @override
  List<Object?> get props => [
        nomenclaturesGroupList,
        countAll,
        limit,
        isEnd,
        nomenclaturesGroup, // Добавляем nomenclaturesGroup в props
      ];
}

class NomenclaturesGroupInitialState extends NomenclaturesGroupState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesGroupListLoadingState extends NomenclaturesGroupState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesGroupListLoadedState extends NomenclaturesGroupState {
  const NomenclaturesGroupListLoadedState({
    required super.nomenclaturesGroupList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  NomenclaturesGroupListLoadedState copyWith({
    List<NomenclaturesGroup>? nomenclaturesGroupList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return NomenclaturesGroupListLoadedState(
      nomenclaturesGroupList:
          nomenclaturesGroupList ?? this.nomenclaturesGroupList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [nomenclaturesGroupList, countAll, limit, isEnd];
}

class NomenclaturesGroupLoadingFailureState extends NomenclaturesGroupState {
  const NomenclaturesGroupLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class NomenclaturesGroupDetailLoadingState extends NomenclaturesGroupState {
  @override
  List<Object?> get props => [];
}

class NomenclaturesGroupDetailLoadedState extends NomenclaturesGroupState {
  const NomenclaturesGroupDetailLoadedState({
    required super.nomenclaturesGroup,
  });

  @override
  List<Object?> get props => [nomenclaturesGroup];

  NomenclaturesGroupDetailLoadedState copyWith({
    NomenclaturesGroup? nomenclaturesGroup,
  }) {
    return NomenclaturesGroupDetailLoadedState(
      nomenclaturesGroup: nomenclaturesGroup ?? this.nomenclaturesGroup,
    );
  }
}
