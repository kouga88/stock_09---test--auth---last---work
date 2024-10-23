import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  OrganizationBloc(
    this.organizationRepo,
  ) : super(OrganizationInitialState()) {
    // ,this.taskRepo
    on<LoadOrganizationListEvent>(_loadOrganizationList);
    on<LoadNextOrganizationListEvent>(_loadNextOrganizationList);
    on<CreateNewOrganizationEvent>(_createNewOrganization);
    on<EditOrganizationEvent>(_editOrganization);
    on<DeleteOrganizationEvent>(_deleteOrganization);

    on<LoadOrganizationDetailEvent>(_loadOrganizationDetail);
  }

  final OrganizationRepo organizationRepo;

  // final TaskRepo taskRepo;

  Future<void> _loadOrganizationList(
    LoadOrganizationListEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      if (state is! OrganizationListLoadedState) {
        emit(OrganizationListLoadingState());
      }
      final (organizationList, countAll) =
          await organizationRepo.getOrganizationList(
        page_size: OrganizationState.showCount,
        page: 1,
        search: event.searchText != null ? "" : event.searchText.toString(),
      );
      // final projectList = await taskRepo.getProjectsShort();

      bool isEnd = OrganizationState.showCount >= countAll;
      emit(OrganizationListLoadedState(
        organizationList: organizationList,
        countAll: countAll,
        isEnd: isEnd,
        limit: OrganizationState.showCount,
      ));
    } catch (e, _) {
      emit(OrganizationLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _loadNextOrganizationList(
    LoadNextOrganizationListEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      if (state is! OrganizationListLoadedState) {
        emit(OrganizationListLoadingState());
      }
      int limit = state.limit!;
      int newLimit = limit + OrganizationState.showCount;
      final (organizationList, countAll) =
          await organizationRepo.getOrganizationList(
        page_size: newLimit,
        page: 1,
        search: event.searchText == null ? '' : event.searchText.toString(),
      );
      if (newLimit > countAll) {
        newLimit = countAll;
      }
      bool isEnd = newLimit == countAll;
      emit((state as OrganizationListLoadedState).copyWith(
          organizationList: organizationList,
          countAll: countAll,
          limit: newLimit,
          isEnd: isEnd));
    } catch (e, _) {
      emit(OrganizationLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _createNewOrganization(
    CreateNewOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      final Organization newOrganization =
          await organizationRepo.createNewOrganization(
        name: event.name!,
        description: event.description!,
      );

      emit((state as OrganizationListLoadedState).copyWith(
          limit: state.limit! + 1,
          countAll: state.countAll! + 1,
          organizationList: [newOrganization, ...state.organizationList!]));
    } catch (e, _) {
      emit(OrganizationLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _editOrganization(
    EditOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      final Organization editedOrganization =
          await organizationRepo.editOrganizationRepo(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      if (state is OrganizationListLoadedState ||
          state is OrganizationListLoadingState) {
        List<Organization> newList = [];
        for (Organization organization in state.organizationList!) {
          if (organization.id == editedOrganization.id) {
            newList.add(editedOrganization);
          } else {
            newList.add(organization);
          }
        }

        emit((state as OrganizationListLoadedState)
            .copyWith(organizationList: newList));
      }
      if (state is OrganizationDetailLoadedState ||
          state is OrganizationDetailLoadingState) {
        emit((state as OrganizationDetailLoadedState)
            .copyWith(organization: editedOrganization));
      }
    } catch (e, _) {
      emit(OrganizationLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  // //
  Future<void> _deleteOrganization(
    DeleteOrganizationEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      await organizationRepo.deleteOrganization(
          id: event.id); //(organizationId: event.id)
      List<Organization> newList = [];
      for (Organization organization in state.organizationList!) {
        if (organization.id != event.id) {
          newList.add(organization);
        }
      }
      emit((state as OrganizationListLoadedState).copyWith(
          organizationList: newList,
          limit: state.limit! - 1,
          countAll: state.countAll! - 1));
    } catch (e, _) {
      emit(OrganizationLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  //

  //
  // Future<void> _loadOrganizationDetail(
  //   LoadOrganizationDetailEvent event,
  //   Emitter<OrganizationState> emit,
  // ) async {
  //   try {
  //     final organization =
  //         await organizationRepo.getOrganizationDetail(event.id);

  //     emit(OrganizationDetailLoadedState(
  //       organization: organization,
  //     ));
  //   } catch (e, _) {
  //     emit(OrganizationLoadingFailureState(exception: e));
  //   } finally {
  //     event.completer?.complete();
  //   }
  // }

  Future<void> _loadOrganizationDetail(
    LoadOrganizationDetailEvent event,
    Emitter<OrganizationState> emit,
  ) async {
    try {
      final organization =
          await organizationRepo.getOrganizationDetail(event.id);

      emit(OrganizationDetailLoadedState(
        organization: organization,
      ));
    } catch (e, _) {
      emit(OrganizationLoadingFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());
  }
}
