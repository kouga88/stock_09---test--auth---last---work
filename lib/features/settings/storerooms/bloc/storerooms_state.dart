part of 'storerooms_bloc.dart';

class StoreroomState extends Equatable {
  static const int showCount = 20;

  const StoreroomState({
    this.storeroomList,
    this.orgList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.storeroom,
  });

  final List<Storeroom>? storeroomList;

  final List<OrganizationShort>? orgList;

  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Storeroom? storeroom;

  @override
  List<Object?> get props => [
        storeroomList,
        countAll,
        limit,
        isEnd,
        storeroom,
        orgList,
      ];
}

class StoreroomInitialState extends StoreroomState {
  @override
  List<Object?> get props => [];
}

class StoreroomListLoadingState extends StoreroomState {
  @override
  List<Object?> get props => [];
}

class StoreroomListLoadedState extends StoreroomState {
  const StoreroomListLoadedState({
    required super.storeroomList,
    required super.orgList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  StoreroomListLoadedState copyWith({
    List<Storeroom>? storeroomList,
    // List<ProjectShort>? projectList,

    List<OrganizationShort>? orgList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return StoreroomListLoadedState(
      storeroomList: storeroomList ?? this.storeroomList,
      orgList: orgList ?? this.orgList,
      countAll: countAll ?? this.countAll,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [
        storeroomList,
        orgList,
        countAll,
        limit,
        isEnd
      ]; // projectList, groupList,
}

class StoreroomLoadingFailureState extends StoreroomState {
  const StoreroomLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class StoreroomDetailLoadingState extends StoreroomState {
  @override
  List<Object?> get props => [];
}

class StoreroomDetailLoadedState extends StoreroomState {
  const StoreroomDetailLoadedState({
    required super.storeroom,
    required super.orgList,
  });

  @override
  List<Object?> get props => [storeroom]; // ,groupList, projectList

  StoreroomDetailLoadedState copyWith({
    Storeroom? storeroom,
    List<OrganizationShort>? orgList,
  }) {
    return StoreroomDetailLoadedState(
      storeroom: storeroom ?? this.storeroom,
      orgList: orgList ?? this.orgList,
    );
  }
}
