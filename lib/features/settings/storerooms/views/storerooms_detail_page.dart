import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/widgets/storerooms_create_form.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/bloc/storerooms_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class StoreroomDetailPage extends StatefulWidget {
  const StoreroomDetailPage({super.key, required this.id});
  final int id;

  @override
  State<StoreroomDetailPage> createState() => _StoreroomDetailPageState();
}

class _StoreroomDetailPageState extends State<StoreroomDetailPage> {
  final _storeroomBloc = StoreroomBloc(GetIt.I<StoreroomRepo>(),
      GetIt.I<OrganizationRepo>(), GetIt.I<DepartmentRepo>());
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _storeroomBloc.add(LoadStoreroomDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant StoreroomDetailPage oldWidget) {
    _storeroomBloc.add(LoadStoreroomDetailEvent(id: widget.id));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isAdmin = false;
    if (authBloc.state is AuthSuccessedState) {
      final authState = (authBloc.state as AuthSuccessedState);
      isAdmin = authState.user.is_staff;
    }

    return BlocBuilder<StoreroomBloc, StoreroomState>(
      bloc: _storeroomBloc,
      builder: (context, state) {
        if (state is StoreroomLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is StoreroomDetailLoadedState) {
          if (state.storeroom != null) {
            Storeroom storeroom = state.storeroom!;
            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => GoRouter.of(context)
                            .pop(), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          storeroom.getName(),
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                      if (isAdmin) ...[
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  StoreroomCreateFromWidget(
                                storeroom: storeroom,
                                bloc: _storeroomBloc,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.primaryColor,
                            side: BorderSide.none,
                          ),
                          child: const Text('Изменить'),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text('Описание:',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: greyBlueColor65)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(storeroom.description.toString(),
                          style: theme.textTheme.bodyLarge),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Организация:',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: greyBlueColor65)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(storeroom.organization.name.toString(),
                          style: theme.textTheme.bodyLarge),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
