// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/form_return/bloc/form_return_bloc.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/form_return/repo/models/form_return.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/widgets/form_employer_widgets.dart';

// class FormReturnPage extends StatefulWidget {
//   const FormReturnPage({super.key});

//   @override
//   State<FormReturnPage> createState() => _FormReturnPageState();
// }

// class _FormReturnPageState extends State<FormReturnPage> {
//   final _formBloc = FormReturnBloc(GetIt.I<UserRepo>());
//   final _formKey = GlobalKey<FormState>();
//   final FromReturn _formCreate = FromReturn();
//   bool _isSubmitting = false;

//   @override
//   void initState() {
//     Completer completer = Completer();
//     _formBloc.add(FormReturnLoadDictionariesEvent(completer: completer));
//     super.initState();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       setState(() {
//         _isSubmitting = true;
//       });

//       // Dispatch the form submission event
//       Completer completer = Completer();
//       var data = {};
//       data['userr_id'] = _formCreate.selectedUserr!.id;

//       String jsonString = json.encode(data);
//       _formBloc.add(FormReturnSaveEvent(
//         jsonString: jsonString,
//       ));

//       completer.future.then((success) {
//         setState(() {
//           _isSubmitting = false;
//         });
//         if (success) {
//           // Show success message or navigate away
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FormReturnBloc, FormReturnState>(
//         bloc: _formBloc,
//         builder: (context, state) {
//           if (state is FormReturnFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is FormLoadedState) {
//             return Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   FormUserrWidget(
//                     formReturn: _formCreate,
//                     userList: state.userList ?? [],
//                     setState: setState,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _submitForm,
//                     child: const Text('Сохранить'),
//                   ),
//                 ],
//               ),
//             );
//           }
//           if (state is FormReturnSuccessSavedState) {
//             if (state.fromReturn != null) {
//               return Text('Еиис');
//             }
//             const ErrorPage(
//               errorMessage: 'Не удалось найти только что созданную задачу!',
//             );
//           }

//           return const Center(child: CircularProgressIndicator());
//         });
//   }
// }

class FormReturnPage extends StatefulWidget {
  const FormReturnPage({super.key});

  @override
  State<FormReturnPage> createState() => _FormReturnPageState();
}

class _FormReturnPageState extends State<FormReturnPage> {
  final _formBloc = FormReturnBloc(GetIt.I<UserRepo>());
  final _formKey = GlobalKey<FormState>();
  final FormReturn _formCreate = FormReturn();
  // ignore: unused_field
  bool _isSubmitting = false;

  @override
  void initState() {
    Completer completer = Completer();
    _formBloc.add(FormReturnLoadDictionariesEvent(completer: completer));
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSubmitting = true;
      });

      // Dispatch the form submission event
      Completer completer = Completer();
      var data = {};
      data['userr_id'] = _formCreate.selectedUserr!.id;

      String jsonString = json.encode(data);
      _formBloc.add(FormReturnSaveEvent(jsonString: jsonString));

      completer.future.then((success) {
        setState(() {
          _isSubmitting = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormReturnBloc, FormReturnState>(
        bloc: _formBloc,
        builder: (context, state) {
          if (state is FormReturnFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          if (state is FormLoadedState) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  FormUserrWidget(
                    formReturn: _formCreate,
                    userList: state.userList ?? [],
                    setState: setState,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        _submitForm, // _isSubmitting ? null : _submitForm,
                    child: const Text('Сохранить'),
                  ),
                ],
              ),
            );
          }
          if (state is FormReturnSuccessSavedState) {
            if (state.jsonString != null) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () =>
                        GoRouter.of(context).pop(), //context.go('/news'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text('Форма успешно создана!'),
                ],
              );
            }
            return const ErrorPage(
              errorMessage: 'Не удалось сохранить форму!',
            );
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
