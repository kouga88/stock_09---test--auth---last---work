// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderEmolyeInfo extends StatelessWidget {
  HeaderEmolyeInfo({
    super.key,
    required this.withRoles,
  });

  final _authBloc = GetIt.I<AuthBloc>();
  final bool withRoles;

  @override
  Widget build(BuildContext context) {
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final theme = Theme.of(context);
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (context, state) {
        final user = (state as AuthSuccessedState).user;
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "images/user.svg",
                        width: 40,
                        height: 40,
                      ),
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse('/users/detail/'),

                        ///users/detail/${user.id}
                        builder:
                            (BuildContext context, FollowLink? followLink) =>
                                TextButton(
                          style: buttonsTheme.linkTextButton,
                          onPressed: () {
                            context.go('/handbook/users/${user.id}');
                            // context.router
                            //     .navigate(UserDetailRoute(id: user.id));
                          },
                          child: Text(
                            user.first_name == null
                                ? '${user.username} ${user.last_name}'
                                : user.username,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (withRoles)
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    "Admin",
                    // user.getRolesDescription(),
                    style: theme.textTheme.labelSmall
                        ?.copyWith(color: greyBlue45Color),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
