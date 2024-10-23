import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/app_inner.dart';
import 'package:pronet_storeroom_v_01/app_inner_error.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/auth/views/auth_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthBloc authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    identity();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant App oldWidget) {
    identity();
    super.didUpdateWidget(oldWidget);
  }

  identity() async {
    Completer completer = Completer();
    authBloc.add(IdentityEvent(completer: completer));
    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthUnknownState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AuthSuccessedState) {
            return AppInner();
          }
          if (state is AuthSuccessedErrorState) {
            return AppInnerError(message: state.message);
          }
          return const AuthPage(); // const AuthPage(); AppInner();// вернуть для отображение авторизации
        },
      ),
    );
  }
}
