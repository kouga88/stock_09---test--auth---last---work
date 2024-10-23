part of 'department_bloc.dart';

class DepartmentState extends Equatable {
  static const int showCount = 20;

  const DepartmentState({
    this.departmentList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.department, // Добавлено поле для организации
  });

  final List<Department>? departmentList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Department? department; // Новое поле для организации

  @override
  List<Object?> get props => [
        departmentList,
        countAll,
        limit,
        isEnd,
        department, // Добавляем department в props
      ];
}

class DepartmentInitialState extends DepartmentState {
  @override
  List<Object?> get props => [];
}

class DepartmentListLoadingState extends DepartmentState {
  @override
  List<Object?> get props => [];
}

class DepartmentListLoadedState extends DepartmentState {
  const DepartmentListLoadedState({
    required super.departmentList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  DepartmentListLoadedState copyWith({
    List<Department>? departmentList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return DepartmentListLoadedState(
      departmentList: departmentList ?? this.departmentList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [departmentList, countAll, limit, isEnd];
}

class DepartmentLoadingFailureState extends DepartmentState {
  const DepartmentLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class DepartmentDetailLoadingState extends DepartmentState {
  @override
  List<Object?> get props => [];
}

class DepartmentDetailLoadedState extends DepartmentState {
  const DepartmentDetailLoadedState({
    required super.department,
  });

  @override
  List<Object?> get props => [department];

  DepartmentDetailLoadedState copyWith({
    Department? department,
  }) {
    return DepartmentDetailLoadedState(
      department: department ?? this.department,
    );
  }
}
