import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';

class HeaderLogout extends StatelessWidget {
  HeaderLogout({
    super.key,
  });

  final _authBloc = GetIt.I<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tooltip(
          message: 'Выйти',
          child: IconButton(
              onPressed: () {
                _authBloc.add(LogOutEvent());
              },
              icon: const Icon(Icons.exit_to_app_outlined)),
        ),
      ],
    );
  }
}
