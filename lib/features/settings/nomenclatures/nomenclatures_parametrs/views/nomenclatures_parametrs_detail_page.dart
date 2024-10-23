import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/bloc/nomenclatures_parametrs_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/nomenclatures_parametrs_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/widgets/nomenclatures_parametrs_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class NomenclaturesParametrsDetailPage extends StatefulWidget {
  const NomenclaturesParametrsDetailPage({super.key, required this.id});
  final int id;

  @override
  State<NomenclaturesParametrsDetailPage> createState() =>
      _NomenclaturesParametrsDetailPageState();
}

class _NomenclaturesParametrsDetailPageState
    extends State<NomenclaturesParametrsDetailPage> {
  final _storeroomBloc = NomenclaturesParametrsBloc(
      GetIt.I<NomenclaturesParametrsRepo>(), GetIt.I<UnitsRepo>());
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _storeroomBloc.add(LoadNomenclaturesParametrsDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NomenclaturesParametrsDetailPage oldWidget) {
    _storeroomBloc.add(LoadNomenclaturesParametrsDetailEvent(id: widget.id));
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

    return BlocBuilder<NomenclaturesParametrsBloc, NomenclaturesParametrsState>(
      bloc: _storeroomBloc,
      builder: (context, state) {
        if (state is NomenclaturesParametrsLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is NomenclaturesParametrsDetailLoadedState) {
          if (state.paramsNom != null) {
            NomenclaturesParametrs paramsNom = state.paramsNom!;
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
                          paramsNom.getName(),
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
                                  NomenclaturesParametrsCreateFromWidget(
                                paramsNom: paramsNom,
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
                      Text(paramsNom.description.toString(),
                          style: theme.textTheme.bodyLarge),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Cклад:',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: greyBlueColor65)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(paramsNom.name.toString(),
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
