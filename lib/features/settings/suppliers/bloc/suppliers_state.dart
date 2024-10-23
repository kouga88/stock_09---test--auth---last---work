part of 'suppliers_bloc.dart';

class SuppliersState extends Equatable {
  static const int showCount = 20;

  const SuppliersState({
    this.suppliersList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.suppliers, // Добавлено поле для организации
  });

  final List<Suppliers>? suppliersList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Suppliers? suppliers; // Новое поле для организации

  @override
  List<Object?> get props => [
        suppliersList,
        countAll,
        limit,
        isEnd,
        suppliers, // Добавляем suppliers в props
      ];
}

class SuppliersInitialState extends SuppliersState {
  @override
  List<Object?> get props => [];
}

class SuppliersListLoadingState extends SuppliersState {
  @override
  List<Object?> get props => [];
}

class SuppliersListLoadedState extends SuppliersState {
  const SuppliersListLoadedState({
    required super.suppliersList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  SuppliersListLoadedState copyWith({
    List<Suppliers>? suppliersList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return SuppliersListLoadedState(
      suppliersList: suppliersList ?? this.suppliersList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [suppliersList, countAll, limit, isEnd];
}

class SuppliersLoadingFailureState extends SuppliersState {
  const SuppliersLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class SuppliersDetailLoadingState extends SuppliersState {
  @override
  List<Object?> get props => [];
}

class SuppliersDetailLoadedState extends SuppliersState {
  const SuppliersDetailLoadedState({
    required super.suppliers,
  });

  @override
  List<Object?> get props => [suppliers];

  SuppliersDetailLoadedState copyWith({
    Suppliers? suppliers,
  }) {
    return SuppliersDetailLoadedState(
      suppliers: suppliers ?? this.suppliers,
    );
  }
}
