part of 'organization_bloc.dart';

class OrganizationState extends Equatable {
  static const int showCount = 20;

  const OrganizationState({
    this.organizationList,
    this.countAll,
    this.limit,
    this.isEnd,
    this.organization, // Добавлено поле для организации
  });

  final List<Organization>? organizationList;
  final int? countAll;
  final int? limit;
  final bool? isEnd;
  final Organization? organization; // Новое поле для организации

  @override
  List<Object?> get props => [
        organizationList,
        countAll,
        limit,
        isEnd,
        organization, // Добавляем organization в props
      ];
}

class OrganizationInitialState extends OrganizationState {
  @override
  List<Object?> get props => [];
}

class OrganizationListLoadingState extends OrganizationState {
  @override
  List<Object?> get props => [];
}

class OrganizationListLoadedState extends OrganizationState {
  const OrganizationListLoadedState({
    required super.organizationList,
    required super.countAll,
    required super.isEnd,
    required super.limit,
  });

  OrganizationListLoadedState copyWith({
    List<Organization>? organizationList,
    int? countAll,
    int? limit,
    bool? isEnd,
  }) {
    return OrganizationListLoadedState(
      organizationList: organizationList ?? this.organizationList,
      isEnd: isEnd ?? this.isEnd,
      limit: limit ?? this.limit,
      countAll: countAll ?? this.countAll,
    );
  }

  @override
  List<Object?> get props => [organizationList, countAll, limit, isEnd];
}

class OrganizationLoadingFailureState extends OrganizationState {
  const OrganizationLoadingFailureState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

class OrganizationDetailLoadingState extends OrganizationState {
  @override
  List<Object?> get props => [];
}

class OrganizationDetailLoadedState extends OrganizationState {
  const OrganizationDetailLoadedState({
    required super.organization,
  });

  @override
  List<Object?> get props => [organization];

  OrganizationDetailLoadedState copyWith({
    Organization? organization,
  }) {
    return OrganizationDetailLoadedState(
      organization: organization ?? this.organization,
    );
  }
}
