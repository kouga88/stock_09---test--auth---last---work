// ignore_for_file: unused_local_variable

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_short.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/form_return/repo/models/form_return.dart';
part 'form_return_event.dart';
part 'form_return_state.dart';

class FormReturnBloc extends Bloc<FormReturnEvent, FormReturnState> {
  FormReturnBloc(this.userRepo) : super(FormInitialState()) {
    on<FormReturnLoadDictionariesEvent>(_loadFormDictionaries);
    on<FormReturnSaveEvent>(_formReturnSave);
  }
  final UserRepo userRepo;

  Future<void> _loadFormDictionaries(
    FormReturnLoadDictionariesEvent event,
    Emitter<FormReturnState> emit,
  ) async {
    try {
      final userList = await userRepo.getUserShort();
      emit(state.copyWith(
        userList: userList,
      ));
    } catch (e, _) {
      emit(FormReturnFailureState(exception: e));
    }
  }

  Future<void> _formReturnSave(
    FormReturnSaveEvent event,
    Emitter<FormReturnState> emit,
  ) async {
    try {
      if (event.jsonString.isNotEmpty) {
        final formReturn = FormReturn.fromJson(
            event.jsonString); // Преобразуем JSON в объект FromReturn.
        emit(FormReturnSuccessSavedState(
            jsonString: event.jsonString, formReturn: state.formReturn));
        // Успешное сохранение данных.
      } else {
        emit(const FormReturnFailureState(
            exception: 'Данные пустые')); // Ошибка при пустых данных.
      }

      // emit(FormReturnSuccessSavedState(fromReturn: fromReturn));
    } catch (e) {
      emit(FormReturnFailureState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
